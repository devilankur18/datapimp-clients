module Datapimp::GithubClient
  class ResponseObject < Hashie::Mash

    def url_fields
      keys.grep(/_url/).inject({}) do |memo,field|
        memo[field] = self.send(field)
        memo
      end
    end

    def with_request_class obj
      @request_class = obj if obj
      self
    end

    def with_request_object obj
      @request_object = obj if obj
      self
    end

    def request_object
      @request_object
    end

    def request_class
      @request_class || Datapimp::GithubClient::Request
    end

    def fetch(relationship, params={})
      if endpoint_for(relationship)
        endpoint_url  = endpoint_for(relationship)
        tmpl          = URITemplate.new(endpoint_url)
        request_class.new(client: request_object.client, endpoint: tmpl.expand(params))
      end
    end

    def endpoint_for(relationship)
      url = url_for(relationship)
      url && url.gsub(%r{https://api.github.com/},'')
    end

    def url_for(relationship)
      field ="#{ relationship }_url"

      if has_key?(field)
        send(field)
      end
    end
  end
end
