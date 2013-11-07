# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rails/commands/server'

MovieClub::Application.load_tasks


TEST_SERVER_PORT = 9999

class TestServer < Rails::Server
  def start
    trap(:INT) { exit }
    create_tmp_directories
    super
  end

  def options
    @options ||= parse_options([])
  end

  def default_options
    super.merge({
      Port: TEST_SERVER_PORT,
    })
  end
end


namespace :test do

  desc 'Run QUnit javascript tests'
  task :qunitjs do
    Thread.new do
      server = TestServer.new
      server.start
    end

    qunit_url = "http://localhost:#{TEST_SERVER_PORT}/qunit"
    qunit_runner_path = Rails.root.join('spec', 'run-qunit.js')
    puts %x(phantomjs #{qunit_runner_path} #{qunit_url})
  end

end

task :default => [:features]
