-- http://projecteuler.net/problem=4

palindrome :: (Eq a) => [a] -> Bool
palindrome xs = xs == reverse xs

main = do
    putStrLn . show . maximum $ [x * y | x <- [100 .. 999], y <- [100 .. 999],
        palindrome . show $ x * y]
