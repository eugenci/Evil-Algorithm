require_relative "lib/evil_algorithm"
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :run do 
  include EvilAlgorithm::Util
  n = 1876191413
  puts "The largest prime factor of #{n} is: "
  puts prime_factors(n).last
end

task :default => :run
