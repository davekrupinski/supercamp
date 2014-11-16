module Supercamp
  module Criteria

    class Abstract
      
      attr_accessor :options

      def initialize(&block)
        @options = {}
        instance_eval(&block) if block_given?
      end

      def endpoint
        name = self.class.to_s.split("::").last.downcase
        "#{Supercamp.config.base_url}/#{name}s"
      end

      def query
        opts = { api_key: Supercamp.config.api_key }.merge(options)
        Typhoeus::Request.new(endpoint, params: opts)
      end

      def response(query=query)
        # TODO: Support Timeout
        query.run.response
      end

      def results

      end

    private

      def merge_option(key, value)
        @options[key.to_s] = value
      end

    end

  end
end
