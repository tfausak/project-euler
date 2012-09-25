# http://projecteuler.net/problem=1
puts (0..999).select { |n| n % 3 == 0 || n % 5 == 0 }.inject{ |sum, x| sum + x }
