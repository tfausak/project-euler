#!/usr/bin/env ruby
# http://projecteuler.net/problem=21

def aliquot_sum(n)
  sqrt = Math.sqrt(n)
  (2..sqrt).select { |d| n % d == 0 }.reduce(n == 1 ? 0 : 1) do |sum, d|
    sum + d + (d == sqrt ? 0 : n / d)
  end
end

aliquot_sums = Hash[(1..10000).map { |n| [n, aliquot_sum(n)] }]
aliquot_sums.reject! { |n, sum| n == sum || aliquot_sums[sum] != n }
puts aliquot_sums.keys.reduce(:+)
