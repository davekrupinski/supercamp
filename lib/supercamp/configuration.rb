module Supercamp

  class Configuration

    attr_accessor :login
    attr_accessor :password

    def configure
      yield self
    end

    def endpoint
      "http://api.amp.active.com/camping/campgrounds"
    end

  end

end
