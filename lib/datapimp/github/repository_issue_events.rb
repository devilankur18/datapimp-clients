module Datapimp
  module Github
    class RepositoryIssueEvents < Request
      def org
        @org || Datapimp::Github.default_organization
      end

      def endpoint
        "repos/#{ org }/#{ repo }/issues/events"
      end
    end
  end
end
