#!/usr/bin/env ruby
# http://projecteuler.net/problem=5

def factor(n)
  factors = Hash.new(0)
  (2..n).each do |divisor|
    while n % divisor == 0
      n /= divisor
      factors[divisor] += 1
    end
    break if n <= 1
  end
  factors
end

factors = Hash.new(0)
(1..20).each do |n|
  factor(n).each do |x, power|
    factors[x] = power if power > factors[x]
  end
end
result = 1
factors.each do |x, power|
  result *= x ** power
end
puts result
