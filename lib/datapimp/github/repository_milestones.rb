module Datapimp
  module Github
    class RepositoryMilestones < Request
      def org
        @org || Datapimp::Github.default_organization
      end

      def endpoint
        "repos/#{ org }/#{ repo }/milestones"
      end
    end
  end
end
