-- http://projecteuler.net/problem=5

main = do
    putStrLn (show (foldl1 lcm [1 .. 20]))
