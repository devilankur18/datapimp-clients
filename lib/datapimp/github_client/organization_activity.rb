  module Datapimp::Github
    class OrganizationActivity < Request
      def endpoint
        "users/#{ user }/events/orgs/#{ org }"
      end
    end
  end
