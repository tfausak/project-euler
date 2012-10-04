#!/usr/bin/env ruby
# http://projecteuler.net/problem=14
collatz, max_n, max_steps = {}, 0, 0
(1..1_000_000).each do |n|
  steps, x = 1, n
  while x > 1
    if x & 1 == 1
      x = (3 * x) + 1
      steps += 1
    else
      x >>= 1
      if collatz.has_key? x
        steps += collatz[x]
        break
      end
      steps += 1
    end
  end
  collatz[n] = steps
  max_n, max_steps = n, steps if steps > max_steps
end
puts max_n
