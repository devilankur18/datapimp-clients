module Datapimp::GithubClient
  class SingleRepository < Request

    def endpoint
      "repos/#{ org }/#{ repo }"
    end
  end
end
