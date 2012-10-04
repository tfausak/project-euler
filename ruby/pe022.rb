#!/usr/bin/env ruby
# http://projecteuler.net/problem=22

names = File.read(ARGV[0]).map { |line| line.split(',') }.flatten.sort
sum = 0
names.each_with_index do |name, index|
  worth = 0
  name.each_byte do |byte|
    byte -= 64
    next if byte < 1 || byte > 26
    worth += byte
  end
  sum += (index + 1) * worth
end
puts sum
