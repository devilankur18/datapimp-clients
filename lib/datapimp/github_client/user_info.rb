module Datapimp::GithubClient
  class UserInfo < Request
    requires :user

    def endpoint
      "users/#{ user }"
    end
  end
end
