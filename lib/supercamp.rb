require "supercamp/configuration"
require "supercamp/criteria"
require "supercamp/version"

module Supercamp

  class << self

    attr_accessor :config

    def configure
      self.config ||= Configuration.new
      yield config
    end

  end

end
