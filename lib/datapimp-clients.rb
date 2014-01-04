begin
  require "active_support/core_ext"
  require 'hashie'
  require 'datapimp'
rescue
  require "rubygems"
  require "active_support/core_ext"
  require 'hashie'
  require 'datapimp'
end

require 'github_client'
require 'amazon_client'

module DatapimpClients
  Version = '0.0.1'
end
