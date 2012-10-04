#!/usr/bin/env ruby
# http://projecteuler.net/problem=17

Ones = [
    4, # zero
    3, # one
    3, # two
    5, # three
    4, # four
    4, # five
    3, # six
    5, # seven
    5, # eight
    4, # nine
]

Teens = [
    3, # ten
    6, # eleven
    6, # twelve
    8, # thirteen
    8, # fourteen
    7, # fifteen
    7, # sixteen
    9, # seventeen
    8, # eighteen
    8, # nineteen
]

Tens = [
    0,
    0,
    6, # twenty
    6, # thirty
    5, # forty
    5, # fifty
    5, # sixty
    7, # seventy
    6, # eighty
    6  # ninety
]

def length(n)
  return Ones[n] if n < 10
  return Teens[n % 10] if n < 20
  if n < 100
    return Tens[n / 10] + ((n % 10 == 0) ? 0 : Ones[n % 10])
  end
  if n < 1000
    return 7 + Ones[n / 100] + ((n % 100 == 0) ? 0 : 3 + length(n % 100))
  end
  return 11 if n == 1000
  0
end

puts (1..1000).map { |n| length(n) }.reduce { |sum, n| sum + n }
