module Datapimp::GithubClient
  class Issues < Request
    requires :org, :repo

    def endpoint
      case
      when supplied_org && repo
        "#{ supplied_org }/#{ repo }/issues"
      when user && repo
        "#{ user }/#{ repo }/issues"
      when supplied_org
        "orgs/#{ supplied_org }/issues"
      when user
        "users/#{ user }/issues"
      end
    end

    def params
      @params.merge(sort:"updated")
    end
  end
end
