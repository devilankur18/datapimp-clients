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

  require 'datapimp/clients/version'
  require 'datapimp/github'
  require 'datapimp/amazon'

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
