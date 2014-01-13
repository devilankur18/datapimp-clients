  module Datapimp::Github
    class RepositoryIssueEvents < Request
      def org
        @org || GithubClient.default_organization
      end

      def endpoint
        "repos/#{ org }/#{ repo }/issues/events"
      end
    end
  end
