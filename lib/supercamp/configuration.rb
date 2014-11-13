module Supercamp

  class Configuration

    attr_accessor :api_key

    def configure
      yield self
    end

    def endpoint
      "http://api.amp.active.com/camping/campgrounds"
    end

  end

end
