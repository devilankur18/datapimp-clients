module Datapimp::GithubClient
  class OrganizationIssues < Request
    requires :supplied_org

    def endpoint
      "orgs/#{ org }/issues"
    end

    def params
      @params.merge(sort:"updated")
    end
  end
end
