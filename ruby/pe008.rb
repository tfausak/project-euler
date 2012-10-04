#!/usr/bin/env ruby
# http://projecteuler.net/problem=8

number = File.read(ARGV[0]).inject { |number, line| number += line.chomp }
max = 0
(0..number.length - 5).each do |offset|
  digits = number[offset..offset + 4].chars.collect { |digit| digit.to_i }
  product = digits.inject { |product, digit| product *= digit }
  max = product if product > max
end
puts max
