module Supercamp
  module Criteria

    class Abstract
      
      attr_accessor :options

      def initialize(&block)
        @options = {}
        instance_eval(&block) if block_given?
      end

      class << self

        def search(&block)
          new &block
        end

      end

      def search(&block)
        self.class.search &block
      end

      def endpoint
        name = self.class.to_s.split("::").last.downcase
        "#{Supercamp.config.base_url}/#{name}s"
      end

      def query
        opts = { api_key: Supercamp.config.api_key }.merge(options)
        Typhoeus::Request.new(endpoint, timeout: Supercamp.config.timeout, params: opts)
      end

      def response(query=query)
        response = query.run
        if response.code == 200
          Supercamp::Response.new response
        else
          raise Supercamp::Error.new self, response
        end
      end

    private

      def merge_option(key, value)
        @options[key.to_s] = value
      end

    end

  end
end
