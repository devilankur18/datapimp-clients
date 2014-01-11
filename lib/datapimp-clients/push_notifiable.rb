module PushNotifiable
  extend ActiveSupport::Concern

  mattr_accessor :configuration

  included do
    after_save :register_apns_token, :if => :apns_token_changed?
  end

  def push_notification_message(message, event_name)
    track(message, "push:#{event_name}")
    PushNotifiable::Worker.perform_async(apns_token: apns_token, message: message, badge: 1, event: event_name, user_id: id, email: email)
  end

  def register_apns_token
    PushNotifiable::RegistrationWorker.perform_async(apns_token: apns_token)
  end

  def self.configure configuration
    @@configuration = configuration

    Urbanairship.application_key=     configuration.urbanairship_application_key
    Urbanairship.application_secret=  configuration.urbanairship_application_secret
    Urbanairship.master_secret=       configuration.urbanairship_master_secret
    Urbanairship.logger=              configuration.logger
  end

  def self.logger
    @@logger ||= Logger.new(Rails.root.join("log","push-notifiable.log"))
  end

  def self.tracker
    @@tracker ||= Tracker.new()
  end

  def self.log message
    logger.info(message)
  end

  def self.error message
    logger.error(message)
  end

  def self.track *args
    tracker.send(:track, *args)
  end

  class Tracker
    def initialize
      @_notifications = Redis::List.new("push_notifiable:notifications_tracker:#{ ::Rails.env }", maxlimit: 200, marshal: true)
      @_errors        = Redis::List.new("push_notifiable:errors_tracker:#{ ::Rails.env }", maxlimit: 200, marshal: true)
      @_counter       = Redis::Counter.new("push_notifiable:counter:#{ ::Rails.env }")
    end

    def track object, type="notification"
      object = {message: object} if object.is_a?(String)
      object[:timestamp]  = Time.now.to_i

      if type == "exception"
        self.errors << object
      else
        object[:counter] = increment
        self.notifications << object
      end
    end

    def increment
      @_counter.increment
    end

    def notifications
      @_notifications
    end

    def errors
      @_errors
    end
  end

  class RegistrationWorker
    include Sidekiq::Worker

    def perform(task)
      task = task.with_indifferent_access
      Urbanairship.register_device(task[:apns_token])
    end
  end

  class Worker
    include Sidekiq::Worker

    def push notification={}
      Urbanairship.push(notification)
    end

    def track type, notification={}
      PushNotifiable.track(notification)
      PushNotifiable.log("type: #{ type }, #{ notification.inspect }")
    end

    def perform(notification={})
      track("perform:notification", notification)
      notification = notification.with_indifferent_access

      event = notification.fetch(:event, "notification")
      apns_token, message, meta_data, badge = notification.values_at(:apns_token, :message, :meta_data, :badge_count)

      response = push({
        device_tokens: [apns_token].flatten.compact,
        meta: meta_data,
        aps:{
          alert: "#{ message }".slice(0,255),
          badge: badge || 1,
          sound: 'default'
        }
      })

      track("response:#{ event }", response)
    rescue
      track("exception:#{ event }", $!)
    end
  end
end
