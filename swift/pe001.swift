// http://projecteuler.net/problem=1

let sum = Array(1..1000)
    .filter { $0 % 3 == 0 || $0 % 5 == 0 }
    .reduce(0, +)
println(sum)
