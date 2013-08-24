-- http://projecteuler.net/problem=9

main = print [(a, b, c) |
        a <- [1..997],
        b <- [a + 1..997],
        c <- [b + 1..997],
        a + b + c == 1000,
        a ^ 2 + b ^ 2 == c ^ 2
    ]
