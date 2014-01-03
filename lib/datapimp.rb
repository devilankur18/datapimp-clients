begin
  require "active_support/core_ext"
  require 'hashie'
rescue
  require "rubygems"
  require "active_support/core_ext"
  require 'hashie'
end

module Datapimp
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload

  autoload :Configuration
  autoload :Smoke

  autoload :Github
  autoload :Amazon

  ClientsVersion = '0.0.1'

  def self.config
    Configuration
  end

  def self.profile
    config.profile
  end
end
