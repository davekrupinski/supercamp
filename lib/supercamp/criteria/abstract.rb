module Supercamp
  module Criteria

    class Abstract
      
      attr_accessor :options

      def initialize(&block)
        @options = {}
        instance_eval(&block) if block_given?
      end

      def endpoint
        # override to give actual endpoints in subclasses
        Supercamp.config.base_url
      end

      def query
        opts = { api_key: Supercamp.config.api_key }.merge(options)
        Typhoeus::Request.new(endpoint, params: opts)
      end

      def response(query=query)
        query.run.response
      end

    private

      def merge_option(key, value)
        @options[key.to_s] = value
      end

    end

  end
end
