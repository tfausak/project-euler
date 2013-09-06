-- http://projecteuler.net/problem=3
import Euler (isPrime)

bound :: Int -> Int
bound = floor . sqrt . fromIntegral

factors :: Int -> [Int]
factors n = [d | d <- [2 .. bound n], n `rem` d == 0, isPrime d]

main = print . maximum . factors $ 600851475143
