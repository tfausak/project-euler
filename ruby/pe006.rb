#!/usr/bin/env ruby
# http://projecteuler.net/problem=6
limit = 100
sum_of_squares = (1..limit).inject { |sum, n| sum + n ** 2 }
square_of_sum = (1..limit).inject { |sum, n| sum + n } ** 2
difference = (sum_of_squares - square_of_sum).abs
puts difference
