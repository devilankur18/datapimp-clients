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

require 'datapimp-clients/github_client'
require 'datapimp-clients/amazon_client'

module DatapimpClients
  Version = '0.0.1'
end
