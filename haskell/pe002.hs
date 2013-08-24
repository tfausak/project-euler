-- http://projecteuler.net/problem=2

fibonacci :: Int -> Int
fibonacci n
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n - 1) + fibonacci (n - 2)

main = print $ sum (takeWhile
        (< 4000000) [n | n <- [fibonacci n | n <- [1 ..]], even n])
