-- http://projecteuler.net/problem=7

prime :: Int -> Bool
prime n = [d | d <- [1 .. floor . sqrt . fromIntegral $ n], rem n d == 0] == [1]

main = do
    putStrLn . show $ [n | n <- [1 ..], prime n] !! 10001
