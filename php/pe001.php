<?php

# http://projecteuler.net/problem=1

$sum = 0;
for ($n = 0; $n < 1000; $n += 1) {
    if ($n % 3 === 0 or $n % 5 === 0) {
        $sum += $n;
    }
}
echo $sum . "\n";

?>
