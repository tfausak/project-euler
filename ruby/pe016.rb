#!/usr/bin/env ruby
# http://projecteuler.net/problem=16
n = 2 ** 1000
sum = 0
while n > 0
  sum += n % 10
  n /= 10
end
puts sum
