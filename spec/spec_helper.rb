require 'rubygems'
require 'supercamp'
require 'vcr'

RSpec.configure do |config|

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr_cassettes'
    c.hook_into :webmock
  end

end
