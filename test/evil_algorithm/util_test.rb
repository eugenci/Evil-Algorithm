
require_relative "../../lib/evil_algorithm/util.rb"
require 'test/unit'
require 'shoulda'

class EvilAlgorithmUtilTest <  Test::Unit::TestCase

  include EvilAlgorithm::Util

  context "sieve" do

    should "return nil if invalid input given" do
      [nil, -100, 'I am a string', 10.5].each {|inval| assert_nil prime_sieve(inval) }
    end

    should "return prime factors up to 3" do
      assert_equal [2], prime_sieve(3) 
    end

    should "return prime factors up to 4" do
      assert_equal [2,3], prime_sieve(4) 
    end

    should "return prime factors up to 9" do
      assert_equal [2,3,5,7], prime_sieve(9) 
    end

    should "return prime factors up to 30" do
      primes = [2,3,5,7,11,13,17,19,23,29]
      assert_equal primes, prime_sieve(30)
    end

  end

  context "prime factors" do
    should "return prime factors" do
      assert_equal [5], prime_factors(25)
      assert_equal [5,7], prime_factors(35)
      assert_equal [2,5], prime_factors(100)
      assert_equal [2,5,7], prime_factors(7000)
      assert_equal [2,5,7,11], prime_factors(77000)
      assert_equal [2,151], prime_factors(1208)
    end

    should "return prime factors of 44564" do
      assert_equal [2,13,857], prime_factors(44564)
    end

    should "return prime factors of 13195" do
      assert_equal [5,7,13,29], prime_factors(13195)
    end
  end
end
