#!/usr/bin/env ruby

require 'evil_algorithm/util'

if __FILE__ == $0
  include EvilAlgorithm::Util
  n = 1876191413
  puts "The largest prime factor of #{n} is: "
  puts prime_factors(n).last
end
