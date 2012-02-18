<?php

/* http://projecteuler.net/problem=1

If we list all the natural numbers below 10 that are multiples of
3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*/

$sum = 0;
for ($n = 0; $n < 1000; $n += 1) {
    if ($n % 3 === 0 or $n % 5 === 0) {
        $sum += $n;
    }
}
echo $sum . "\n";

?>
