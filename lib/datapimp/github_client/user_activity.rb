module Datapimp::GithubClient
  class UserActivity < Request
    requires :user

    def endpoint
      "users/#{user}/events"
    end

    def organization_repos
      all.select do |item|
        item.repo && item.repo.name.try(:match,org) rescue false
      end
    end

  end
end
