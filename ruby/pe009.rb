# http://projecteuler.net/problem=9
(3..997).each do |c|
  (2..c).each do |b|
    (1..b).each do |a|
      next unless a + b + c == 1_000
      next unless a ** 2 + b ** 2 == c ** 2
      puts a * b * c
      exit
    end
  end
end
