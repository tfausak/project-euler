// http://projecteuler.net/problem=1

var sum, n;
sum = 0;
for (n = 0; n < 1000; n += 1) {
    if ((n % 3 === 0) || (n % 5 === 0)) {
        sum += n;
    }
}
console.log(sum);
