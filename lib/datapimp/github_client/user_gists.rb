module Datapimp::GithubClient
  class UserGists < Request
    requires :user

    def endpoint
      "users/#{ user }/gists"
    end
  end
end
