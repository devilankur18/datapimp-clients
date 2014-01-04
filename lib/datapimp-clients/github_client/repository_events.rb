  module Github
    class RepositoryEvents < Request
      def org
        @org || GithubClient.default_organization
      end

      def endpoint
        "repos/#{ org }/#{ repo }/events"
      end
    end
  end
