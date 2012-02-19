-- http://projecteuler.net/problem=1

main = do
    putStrLn . show $ sum [n | n <- [1 .. 999], rem n 3 == 0 || rem n 5 == 0]
