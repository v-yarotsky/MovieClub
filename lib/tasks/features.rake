require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:features) do |t|
  t.pattern = "spec/features/**/*_spec.rb"
end
