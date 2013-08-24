-- http://projecteuler.net/problem=3

bound :: Int -> Int
bound n = floor . sqrt . fromIntegral $ n

prime :: Int -> Bool
prime n = [d | d <- [1 .. bound n], rem n d == 0] == [1]

factors :: Int -> [Int]
factors n = [d | d <- [1 .. bound n], rem n d == 0, prime d]

main = print . maximum . factors $ 600851475143
