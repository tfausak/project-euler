#!/usr/bin/env ruby
# http://projecteuler.net/problem=18 & http://projecteuler.net/problem=67

triangle = File.read(ARGV[0]).map { |line| line.split.map { |n| n.to_i } }
(triangle.length - 1).downto(0).each do |row|
  (0..triangle[row].length - 2).each do |column|
    cell = triangle[row][column]
    neighbor = triangle[row][column + 1]
    triangle[row - 1][column] += [cell, neighbor].max
  end
end
puts triangle[0][0]
