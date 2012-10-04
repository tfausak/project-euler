#!/usr/bin/env perl
# http://projecteuler.net/problem=16
# Finds the sum of the digits of 2^1000. Straightforward application of bigint.

use strict;
use warnings;

use bigint;

my $n = 2 ** 1000;
my $sum = 0;

while ($n >= 1) {
    $sum += $n % 10;
    $n /= 10;
}

print $sum . "\n";
