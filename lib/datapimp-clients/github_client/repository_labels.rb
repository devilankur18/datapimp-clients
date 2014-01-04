  module Github
    class RepositoryLabels < Request
      def org
        @org || GithubClient.default_organization
      end

      def endpoint
        "repos/#{ org }/#{ repo }/labels"
      end

      def stage_labels
        @stage_labels ||= all.select {|label| label.name && label.name.match(/^s:/) }
      end

      def priority_labels
        @priority_labels ||= all.select {|label| label.name && label.name.match(/^p:/) }
      end

    end
  end
