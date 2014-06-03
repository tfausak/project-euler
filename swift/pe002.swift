// http://projecteuler.net/problem=2

var sum = 0
for var x = 0, y = 1; x < 4_000_000; (x, y) = (y, x + y) {
    if x % 2 == 0 {
        sum += x
    }
}
println(sum)
