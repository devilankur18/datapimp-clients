module Datapimp::GithubClient
  class SingleRepository < Request
    requires :org, :repo

    def endpoint
      "repos/#{ org }/#{ repo }"
    end
  end
end
