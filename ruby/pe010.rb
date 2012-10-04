#!/usr/bin/env ruby
# http://projecteuler.net/problem=10
def is_prime(n)
  return false if n == 1
  return true if n < 4
  return false if n % 2 == 0
  return true if n < 9
  return false if n % 3 == 0

  (5..Math.sqrt(n)).step(6).each do |x|
    return false if n % x == 0
    return false if n % (x + 2) == 0
  end

  true
end

puts((1..2_000_000).find_all { |n| is_prime(n) }.inject { |sum, n| sum + n })
