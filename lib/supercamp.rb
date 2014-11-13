require "typhoeus"

require "supercamp/configuration"
require "supercamp/criteria"
require "supercamp/request"
require "supercamp/version"

module Supercamp
  extend self

  def config
    @config ||= Configuration.new
  end

  def configure
    yield config
  end

  def search(&block)
    Criteria.new &block
  end

end
