  module Datapimp::GithubClient
    class UserActivity < Request

      def org
        @org || GithubClient.default_organization
      end

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
