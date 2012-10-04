#!/usr/bin/env ruby
# http://projecteuler.net/problem=9

(1..332).each do |a|
  (a..(999 - a) / 2).each do |b|
    c = 1000 - b - a
    next unless a ** 2 + b ** 2 == c ** 2
    puts a * b * c
    exit
  end
end
