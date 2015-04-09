-- | http://projecteuler.net/problem=8
module Euler8 where

import Data.Char (digitToInt, isDigit)
import Data.List (tails)

main, main' :: IO ()
main = do
    input <- getContents
    let output = euler8 13 input
    print output

main' = getContents >>= print . euler8 13

euler8, euler8' :: Int -> String -> Int
euler8 n x
    = maximum
    $ map product
    $ takes n
    $ map digitToInt
    $ filter isDigit x

euler8' n = maximum . map product . takes n . map digitToInt . filter isDigit

takes, takes' :: Int -> [a] -> [[a]]
takes _ [] = [[]]
takes n xs@(_ : ys) = take n xs : takes n ys

takes' n = map (take n) . tails
