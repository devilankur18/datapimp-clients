module Datapimp::GithubClient
  class RepositoryIssues < Request
    requires :org, :repo
    def endpoint
      "repos/#{ org }/#{ repo }/issues"
    end
  end
end
