require File.expand_path("../../lib/simple_api_auth", __FILE__)
require 'rack/mock'
require 'json'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

  config.mock_with :rspec
  
end