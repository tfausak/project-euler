#!/usr/bin/env ruby
# http://projecteuler.net/problem=3

n = 600_851_475_143
factor = 1
while n != 1
  factor += 1
  n /= factor while n % factor == 0
end

puts factor
