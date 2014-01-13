  module Datapimp::Github
    class RepositoryMilestones < Request
      def org
        @org || GithubClient.default_organization
      end

      def endpoint
        "repos/#{ org }/#{ repo }/milestones"
      end
    end
  end
