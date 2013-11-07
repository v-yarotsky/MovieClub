begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:features) do |t|
    t.pattern = "spec/features/**/*_spec.rb"
    t.rspec_opts = "--format documentation"
  end
rescue LoadError
  # Don't want this task in production
end

