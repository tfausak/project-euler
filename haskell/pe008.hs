-- http://projecteuler.net/problem=8

import Data.Char (digitToInt, isDigit)

main = do
    contents <- getContents
    print $
     maximum $
      map product $
       takes 5 $
        map digitToInt $
         filter isDigit contents

takes :: Int -> [a] -> [[a]]
takes _ [] = []
takes n xs = take n xs : takes n (tail xs)
