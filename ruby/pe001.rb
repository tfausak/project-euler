# http://projecteuler.net/problem=1
sum = 0
for n in 0..999
    if n % 3 == 0 or n % 5 == 0
        sum += n
    end
end
puts sum
