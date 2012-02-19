-- http://projecteuler.net/problem=6

main = do
    putStrLn . show $ ((sum [1 .. 100]) ** 2) - (sum [n ** 2 | n <- [1 .. 100]])
