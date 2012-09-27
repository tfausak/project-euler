#!/usr/bin/perl
# http://projecteuler.net/problem=20
# Finds the sum of the digits of 100! (100 factorial). Similar to problem number
# 16, which sums the digits of 2^1000.

use strict;
use warnings;

use bigint;

my $limit = 100;
my $factorial = 1;
my $sum = 0;

for (my $n = 2; $n <= $limit; $n++) {
    $factorial *= $n;
}

while ($factorial >= 1) {
    $sum += $factorial % 10;
    $factorial /= 10;
}

print $sum . "\n";
