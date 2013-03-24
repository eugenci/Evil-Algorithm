#!/usr/bin/env ruby

module EvilAlgorithm
  module Util
    # Implementation of Sieve of Eratosthenes algorithm
    # http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
    def prime_sieve(n)
      return nil unless valid_input?(n)

      # sieve[i] == true  => i is prime
      # sieve[i] == false => i is not prime
      sieve = Array.new(n){ true }
      sieve[0], sieve[1]  = [false]*2

      # eliminate from sieve all multipliers of p
      # where p between 2 and n ** 0.5 
      (2 .. sqrt(n)).each do |p|
        next if p > 2 && p % 2 == 0 # optimization: all multipliers of 2 were marked at first step
        j = p*p                     # optimization: up to this step all 2 .. p*p primes where already marked

        while sieve[p] && j <= n do
          sieve[j] = false
          j += p
        end
      end

      primes = []
      sieve.each_with_index {|bool,index| primes << index if bool}

      primes
    end

    # Implementation of Trial division algorithm for integer factorization
    # http://en.wikipedia.org/wiki/Trial_division
    def prime_factors(n)
      return nil unless valid_input?(n)
      return [1] if n == 1

      primes = prime_sieve(sqrt(n) + 1)
      prime_factors = []

      primes.each do |p|
        break if p*p > n

        while n % p == 0 do
          prime_factors << p
          n /= p 
        end
      end

      prime_factors << n if n > 1
      prime_factors.uniq # eliminate perfect square's duplicates
    end

    def valid_input?(n)
      n.is_a?(Integer) && n > 1
    end

    def sqrt(n)
      (n**0.5).to_i
    end
  end
end
