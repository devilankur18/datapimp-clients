module Datapimp::GithubClient
  class OrganizationRepositories < Request
    requires :supplied_org

    def endpoint
      "orgs/#{ org }/repos"
    end

    def all
      @all ||= self.result
    end

    def to_list
      all.map do |repository|
        repository.slice("id","name","html_url","description","ssh_url")
      end
    end

  end
end
