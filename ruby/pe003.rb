#!/usr/bin/env ruby
# http://projecteuler.net/problem=3
n = 600_851_475_143
n /= 2 while n % 2 == 0

factor = 3
while n != 1
  n /= factor while n % factor == 0
  factor += 2
end
factor -= 2

puts factor
