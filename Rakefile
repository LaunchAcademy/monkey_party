begin
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = "--format pretty" # Any valid command line option can go here.
  end

rescue LoadError
  puts "Cucumber not installed. You will not be able to run features"
end

#!/usr/bin/env rake
require "bundler/gem_tasks"
