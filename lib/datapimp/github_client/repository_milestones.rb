module Datapimp::GithubClient
  class RepositoryMilestones < Request
    requires :org, :repo

    def endpoint
      "repos/#{ org }/#{ repo }/milestones"
    end
  end
end
