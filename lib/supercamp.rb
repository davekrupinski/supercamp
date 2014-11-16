require "typhoeus"

require "supercamp/campground"
require "supercamp/configuration"
require "supercamp/version"
require "supercamp/criteria/abstract"
require "supercamp/criteria/campsite"
require "supercamp/criteria/campground"
require "supercamp/criteria/detail"

module Supercamp
  extend self

  def config
    @config ||= Configuration.new
  end

  def configure
    yield config
  end

end
