-- http://projecteuler.net/problem=2

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

main = do
    putStrLn (show (sum (takeWhile (< 4000000)
        [n | n <- [fibonacci n | n <- [1 ..]], even n])))
