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
  autoload :OrganizationIssues
  autoload :RepositoryEvents
  autoload :RepositoryIssues
  autoload :RepositoryLabels
  autoload :RepositoryMilestones
  autoload :SingleRepository
  autoload :UserActivity
  autoload :UserInfo
  autoload :UserIssues

  # Datapimp.github_client is useful for backend apps where there is a Datapimp configuration profile
  Datapimp.define_singleton_method(:github_client) do
    Datapimp::GithubClient::Client.new(github_token: Datapimp.profile.github_token)
  end

  # Datapimp.github_client_for(user) is useful for multi-user apps which use the users
  # github authentication token to make requests on behalf of the user
  Datapimp.define_singleton_method(:github_client_for) do |user_or_token|
    key = :user if user_or_token.respond_to?(:github_token)
    key = :github_token if user_or_token.is_a?(String)

    Datapimp::GithubClient::Client.new(key => user_or_token)
  end

end

Datapimp::GithubClient.eager_load!
