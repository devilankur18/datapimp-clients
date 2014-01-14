module Datapimp::GithubClient
  class OrganizationUsers < Request
    requires :supplied_org

    def endpoint
      "orgs/#{ org }/members"
    end
  end
end
