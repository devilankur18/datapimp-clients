module Datapimp::GithubClient
  class RepositoryEvents < Request
    requires :org, :repo
    def endpoint
      "repos/#{ org }/#{ repo }/events"
    end
  end
end
