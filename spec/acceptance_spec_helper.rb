require 'spec_helper'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist

module TestUser
  def test_user
    @test_user ||= User.create!(email: "mail@example.com", password: "Pa$$w0rd")
  end
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include TestUser

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    Warden.test_mode!
  end

  config.after(:each) do
    Warden.test_reset!
  end
end

