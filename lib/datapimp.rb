begin
  require "active_support/core_ext"
  require 'hashie'
rescue
  require "rubygems"
  require "active_support/core_ext"
  require 'hashie'
end

require 'datapimp/clients/version'

module Datapimp
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload

  autoload :Configuration
  autoload :Smoke
  autoload :ClientsVersion
  autoload :Github
  autoload :Amazon

  def self.config
    Configuration
  end

  def self.profile
    config.profile
  end

  def self.github_client
    Datapimp::Github::Client.new(gitub_token: Datapimp.profile.github_token)
  end
end
