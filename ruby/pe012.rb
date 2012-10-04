#!/usr/bin/env ruby
# http://projecteuler.net/problem=12
def divisors (n)
  result = 2
  (2..Math.sqrt(n)).each do |d|
    if n % d == 0
      result += 2
    end
  end
  result
end

limit = 500
triangle = 0
n = 1
while true
  triangle = (n * (n + 1)) / 2
  d = divisors(triangle)
  break if d > limit
  n += 1
end
puts triangle
