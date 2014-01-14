module Datapimp::GithubClient
  class UserOrganizations < Request
    requires :user

    def endpoint
      "users/#{ user }/orgs"
    end
  end
end
