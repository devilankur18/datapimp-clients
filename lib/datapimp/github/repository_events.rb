module Datapimp
  module Github
    class RepositoryEvents < Request
      def org
        @org || Datapimp::Github.default_organization
      end

      def endpoint
        "repos/#{ org }/#{ repo }/events"
      end
    end
  end
end