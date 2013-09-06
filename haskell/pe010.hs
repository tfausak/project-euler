-- http://projecteuler.net/problem=10
import Euler (isPrime)

main = print $ sum (filter isPrime [2 .. 2000000])
