  module Github
    class OrganizationUsers < Request
      def org
        @org || Datapimp.profile.github_organization
      end

      def endpoint
        options[:endpoint] || "orgs/#{ org }/members"
      end

      def self.logins
        new(user:"mantrabot").all.map(&:login)
      end
    end
  end
