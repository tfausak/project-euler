#!/usr/bin/env ruby
# http://projecteuler.net/problem=10

def sieve(limit)
  sieve_bound = (limit - 1) / 2
  cross_limit = (Math.sqrt(limit) - 1) / 2
  sieve = {}
  primes = [2]

  (1..cross_limit).each do |n|
    next if sieve.has_key? n
    (2 * n * (n + 1)..sieve_bound).step(2 * n + 1).each do |m|
      sieve[m] = true
    end
  end

  (1..sieve_bound).each do |n|
    next if sieve.has_key? n
    primes << 2 * n + 1
  end

  primes
end

puts sieve(2_000_000).reduce(:+)
