-- http://projecteuler.net/problem=10

primes :: [Int]
primes = filter isPrime [2..]

isPrime :: Int -> Bool
isPrime n = [d | d <- [1 .. floor . sqrt . fromIntegral $ n], rem n d == 0] == [1]

main = print (sum (takeWhile (< 2000000) primes))
