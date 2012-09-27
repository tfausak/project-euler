#!/usr/bin/perl
# http://projecteuler.net/problem=48
# Finds the last 10 digits of 1^1 + 2^2 + ... + 1000^1000. Performs n^n in a
# loop, trimming to the first d digits every iteration. Because of this, no
# large numbers are computed and bigint is unnecessary.

use strict;
use warnings;

my $limit = 1000;
my $digits = 10;
my $sum = 0;

foreach my $n (1 .. $limit) {
    my $nn = 1; # $nn is n^n

    foreach (1 .. $n) {
        $nn *= $n;
        $nn = substr($nn, -1 * $digits);
    }

    $sum += $nn;
}

print substr($sum, -1 * $digits);
