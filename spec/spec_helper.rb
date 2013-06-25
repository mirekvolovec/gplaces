require 'rubygems'
require 'bundler/setup'
require 'vcr'
require 'rspec'
require 'ap'

require 'gplaces'

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/vcr_cassettes'
  c.ignore_localhost         = true
  c.default_cassette_options = { :record => :new_episodes }
  c.hook_into :webmock
  #c.debug_logger = $stdout
end