#!/usr/bin/env ruby
# http://projecteuler.net/problem=2
limit, x, y, sum = 4e6, 1, 1, 0
while x < limit
  sum += x if x % 2 == 0
  x, y = y, x + y
end
puts sum
