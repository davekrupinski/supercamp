require "supercamp/configuration"
require "supercamp/criteria"
require "supercamp/version"

module Supercamp
  extend self

  attr_accessor :config

  def configure
    self.config ||= Configuration.new
    yield config
  end

  def search(&block)
    Criteria.new &block
  end

end
