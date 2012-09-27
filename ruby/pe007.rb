# http://projecteuler.net/problem=7
def is_prime(n)
  return false if n == 1
  return true if n < 4
  return false if n % 2 == 0
  return true if n < 9
  return false if n % 3 == 0

  (5..Math.sqrt(n)).step(6).each do |x|
    return false if n % x == 0
    return false if n % (x + 2) == 0
  end

  true
end

n, count = 0, 0
while count < 10_001
  n += 1
  count += 1 if is_prime(n)
end
puts n
