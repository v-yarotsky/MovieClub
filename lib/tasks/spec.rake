require 'rails/commands/server'

TEST_SERVER_PORT = 9999

class TestServer < Rails::Server
  def options
    @options ||= parse_options([])
  end

  def default_options
    super.merge({
      Port: TEST_SERVER_PORT,
      pid: File.expand_path('tmp/pids/testserver.pid'),
    })
  end
end

namespace :spec do
  begin
    require 'rspec/core/rake_task'

    RSpec::Core::RakeTask.new(:features) do |t|
      t.pattern = "spec/features/**/*_spec.rb"
      t.rspec_opts = "--format documentation"
    end
  rescue LoadError
    # Don't want this task in production
  end

  desc 'Run QUnit javascript tests'
  task javascripts: :environment do
    require 'net/http'
    Thread.abort_on_exception = true

    Thread.new do
      server = TestServer.new
      server.start
    end

    qunit_url = "http://localhost:#{TEST_SERVER_PORT}/qunit"
    slept_times = 0

    begin
       Net::HTTP.get(URI(qunit_url))
    rescue Errno::ECONNREFUSED
      sleep 0.1
      slept_times += 1
      retry unless slept_times > 50
    end

    qunit_runner_path = Rails.root.join('spec', 'run-qunit.js')
    puts %x(phantomjs #{qunit_runner_path} #{qunit_url})
  end

end
