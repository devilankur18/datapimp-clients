module Datapimp::GithubClient
  class RepositoryIssueEvents < Request
    requires :org, :repo

    def endpoint
      "repos/#{ org }/#{ repo }/issues/events"
    end
  end
end
