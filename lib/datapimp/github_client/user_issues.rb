module Datapimp::GithubClient
  class UserIssues < GithubClient::Request
    requires :user

    def endpoint
      "users/#{ user }/issues"
    end

    def params
      @params.merge(sort:"updated")
    end
  end
end
