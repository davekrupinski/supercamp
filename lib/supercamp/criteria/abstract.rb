module Supercamp
  module Criteria
    class Abstract

      attr_reader   :options
      attr_writer   :response

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

      def url
        "#{Supercamp.config.base_url}#{endpoint}"
      end

      def query
        opts = { api_key: Supercamp.config.api_key }.merge(options)
        Typhoeus::Request.new(url, timeout: Supercamp.config.timeout, params: opts, followlocation: true)
      end

      def response(query=self.query)
        return @response unless @response.nil?
        response = query.run
        if response.code == 200
          @response = Supercamp::Response.new response
          @response.freeze
        else
          raise Supercamp::Error.new self, response
        end
      end

      def count
        response.count
      end

      def results
        response.results
      end

    private

      def endpoint
        # Implement in Subclass
      end

      def merge_option(key, value)
        @options.dup.merge({ key.to_s => value }).tap do |opts|
          @options  = opts
          @response = nil
          @options.freeze
        end
      end
    end
  end
end
