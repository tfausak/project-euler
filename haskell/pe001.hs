-- http://projecteuler.net/problem=1
main = putStrLn (show (sum
    [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]))
