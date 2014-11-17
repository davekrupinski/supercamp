require 'typhoeus'

require 'supercamp/configuration'
require 'supercamp/error'
require 'supercamp/response'
require 'supercamp/version'
require 'supercamp/criteria/abstract'
require 'supercamp/criteria/campsite'
require 'supercamp/criteria/campground'
require 'supercamp/criteria/detail'

module Supercamp
  extend self

  def config
    @config ||= Configuration.new
  end

  def configure
    yield config
  end

  def campsites
    Supercamp::Criteria::Campsite.new
  end

  def campgrounds
    Supercamp::Criteria::Campground.new
  end

  def details
    Supercamp::Criteria::Detail.new
  end

end
