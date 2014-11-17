module Supercamp

  class Configuration

    attr_accessor :api_key
    attr_accessor :timeout

    def initialize
      @timeout ||= 5
    end

    def configure
      yield self
    end

    def base_url
      "http://api.amp.active.com/camping"
    end

  end

end
