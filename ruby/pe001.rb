#!/usr/bin/env ruby
# http://projecteuler.net/problem=1

sum = (0...1000).select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(:+)
puts sum
