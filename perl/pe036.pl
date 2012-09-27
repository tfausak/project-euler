#!/usr/bin/perl

# Project Euler problem 36
# by Taylor Fausak

# Finds the sum of all numbers below one million that are palindromic in both
# base 10 and base 2. Simple brute-force approach, although it only checks odd
# numbers since an even number represented in binary is 1...0.

use strict;
use warnings;

my $limit = 1000000;
my $sum = 0;

for (my $n = 1; $n <= $limit; $n += 2) {
    if ($n != reverse($n)) {
        next;
    }

    my $b = sprintf("%b", $n);

    if ($b != reverse($b)) {
        next;
    }

    $sum += $n;
}

print $sum . "\n";
