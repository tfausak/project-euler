-- http://projecteuler.net/problem=7
import Euler (isPrime)

main = print $ [n | n <- [1 ..], isPrime n] !! 10001
