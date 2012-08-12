#!/usr/bin/perl

# Project Euler problem 57
# by Taylor Fausak

# Series is 3/2, 7/5, 17/12, ... . Let n and d be the numerator and denominator,
# respectively. Then the series is n/d, (n+2d)/(n+d), ... .

use strict;
use warnings;

use bigint;

my $count = 0;
my $n = 3;
my $d = 2;

foreach (1 .. 1000) {
    if (length($n) > length($d)) {
        $count++;
    }

    ($n, $d) = ($n + 2 * $d, $n + $d);
}

print $count . "\n";
