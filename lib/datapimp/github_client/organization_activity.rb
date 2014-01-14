module Datapimp::GithubClient
  class OrganizationActivity < Request
    requires :supplied_org, :user

    def endpoint
      "users/#{ user }/events/orgs/#{ org }"
    end
  end
end
