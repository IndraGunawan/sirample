# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../../lib', __FILE__)

require File.expand_path '../../lib/web.rb', __FILE__

require 'simplecov'
require "bundler/setup"
require 'rack/test'

SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start

module RSpecMixin
  include Rack::Test::Methods
  def app() Web end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include RSpecMixin
end
