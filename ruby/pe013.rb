#!/usr/bin/env ruby
# http://projecteuler.net/problem=13

puts File.read(ARGV[0]).map(&:to_i).reduce(:+).to_s.slice(0, 10)
