# http://projecteuler.net/problem=13
puts File.read(ARGV[0]).map { |line| line.to_i }.reduce { |sum, n| sum + n }.to_s.slice(0, 10)
