# http://projecteuler.net/problem=20
factorial = (1..100).inject { |factorial, n| factorial * n }
sum = 0
while factorial > 0
  sum += factorial % 10
  factorial /= 10
end
puts sum
