#!/usr/bin/env ruby
# http://projecteuler.net/problem=4

max = 0
999.downto(900).each do |x|
  x.downto(900).each do |y|
    product = x * y
    break if product < max
    max = product if product.to_s == product.to_s.reverse
  end
end
puts max
