#!/usr/bin/perl
# http://projecteuler.net/problem=9
# Finds the product abc of the Pythagorean triplet where a + b + c = 1000. For
# two numbers n and m, the following formulas produce a triplet if m > n
#   a = 2 * m * n
#   b = m^2 - n^2
#   c = m^2 + n^2
# and the product, abc, is given by
#   abc = (2 * m * n) * (m^4 - n^4)

use strict;
use warnings;

my $limit = 1000;
my $product;

for (my $m = 2; $m <= sqrt($limit); $m++) {
    my $n = ($limit / (2 * $m)) - $m;

    if ($n > 0 && $n == int($n)) {
        $product = 2 * $m * $n * ($m ** 4 - $n ** 4);
    }
}

print $product . "\n";
