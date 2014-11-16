module Supercamp

  class Configuration

    attr_accessor :api_key

    def configure
      yield self
    end

    def base_url
      "http://api.amp.active.com/camping"
    end

  end

end
