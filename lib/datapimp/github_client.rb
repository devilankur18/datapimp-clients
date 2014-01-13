module Datapimp::GithubClient
  mattr_accessor :default_github_token,
                  :default_organization

  def self.default_organization
    Datapimp.profile.github_organization
  end

  def self.default_github_token
    Datapimp.profile.github_token
  end

  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Authentication
    autoload :Client
    autoload :Request
    autoload :RequestWrapper
  end

  autoload :IssueLabels
  autoload :Issues
  autoload :MilestoneIssues
  autoload :OrganizationActivity
  autoload :OrganizationRepositories
  autoload :OrganizationUsers
  autoload :RepositoryEvents
  autoload :RepositoryIssues
  autoload :RepositoryLabels
  autoload :RepositoryMilestones
  autoload :SingleRepository
  autoload :UserActivity
  autoload :UserInfo

  Datapimp.define_singleton_method(:github_client) do
    GithubClient::Client.new(github_token: Datapimp.profile.github_token)
  end

end

Datapimp::GithubClient.eager_load!
