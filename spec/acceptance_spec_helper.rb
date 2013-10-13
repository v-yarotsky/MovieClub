require 'spec_helper'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.default_wait_time = 5

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end
end

