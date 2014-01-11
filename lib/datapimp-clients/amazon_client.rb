require "aws-sdk"

module AmazonClient
  mattr_accessor :access_key_id, :secret_access_key

  require 'datapimp-clients/amazon_client/sts'

  def self.access_key_id
    @@access_key_id || Datapimp.profile.amazon_access_key_id || ENV['ACCESS_KEY_ID']
  end

  def self.secret_access_key
    @@secret_access_key || Datapimp.profile.amazon_secret_access_key || ENV['SECRET_ACCESS_KEY']
  end

  def self.configured?
    !!(access_key_id.present? && secret_access_key.present? && (@configured || configure))
  end

  def self.configure
    result = AWS.config({
      :access_key_id => access_key_id,
      :secret_access_key => secret_access_key
    })

    @configured = true

    result
  end

  def self.temporary_s3 options={}
    sts = AmazonClient::STS.new
    AWS::S3.new(sts.credentials)
  end
end
