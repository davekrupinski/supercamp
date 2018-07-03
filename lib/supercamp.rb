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
  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield config
  end

  def self.campsites
    Supercamp::Criteria::Campsite.new
  end

  def self.campgrounds
    Supercamp::Criteria::Campground.new
  end

  def self.details
    Supercamp::Criteria::Detail.new
  end
end
