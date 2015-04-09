-- | http://projecteuler.net/problem=8
module Euler8 where

import Data.Char (digitToInt, isDigit)
-- import Data.List (tails)

main :: IO ()
main = do
    input <- getContents
    let output = euler8 input
    print output
-- main = getContents >>= print . euler8

euler8 :: String -> Int
euler8 x
    = maximum
    . map product
    . takes 13
    . map digitToInt
    $ filter isDigit x
-- euler8 = maximum . map product . takes 13 . map digitToInt . filter isDigit

takes :: Int -> [a] -> [[a]]
takes _ [] = []
takes n xs@(_ : ys) = take n xs : takes n ys
-- takes n = map (take n) . tails
