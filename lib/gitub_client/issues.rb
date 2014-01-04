module GithubClient
  class Issues < GithubCient::Request
    def params
      @params.merge(sort:"updated")
    end

    def endpoint
      "orgs/#{ org }/issues"
    end
  end
end
