  module Datapimp::Github
    class RepositoryIssues < Request
      def org
        @org || GithubClient.default_organization
      end

      def endpoint
        "repos/#{ org }/#{ repo }/issues"
      end

    end
  end
