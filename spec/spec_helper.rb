require 'rubygems'
require 'supercamp'
require 'vcr'

RSpec.configure do |config|

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr_cassettes'
    c.hook_into :webmock
  end

end
