-- http://projecteuler.net/problem=9

main = print $ maximum $ map product [[a, b, c] |
        a <- [1..332], -- 332 + 333 + 334 = 999
        b <- [a + 1..1000 - a], -- a + b <= 1000
        c <- [1000 - b - a],
        a ^ 2 + b ^ 2 == c ^ 2
    ]
