module Supercamp
  class Error < StandardError
    attr_reader :code
    attr_reader :api_code
    attr_reader :criteria

    def initialize(criteria, response)
      @code     = response.options[:code]
      @api_code = response.options[:headers]['X-Mashery-Error-Code']
      @criteria = criteria
      super(response.body)
    end
  end
end
