module Datapimp::GithubClient
  class UserRepositories < Request
    requires :user

    def endpoint
      "users/#{ user }/repos"
    end
  end
end
