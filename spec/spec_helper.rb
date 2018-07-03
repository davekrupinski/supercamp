require 'rubygems'
require 'supercamp'
require 'vcr'
require 'dotenv'

require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|

  Dotenv.load

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  Supercamp.configure do |c|
    c.api_key = ENV['API_KEY']
  end

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr_cassettes'
    c.hook_into :typhoeus
  end

end
