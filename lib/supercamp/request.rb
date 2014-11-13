module Supercamp

  class Request

    attr_accessor :criteria

    def initialize(criteria)
      self.criteria = criteria
    end

    def query
      opts = { api_key: Supercamp.config.api_key }.merge(criteria.options)
      Typhoeus::Request.new(Supercamp.config.endpoint, params: opts)
    end

    def response(query=query)
      query.run.response
    end

  end

end
