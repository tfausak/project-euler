#!/usr/bin/perl

# Project Euler problem 12
# by Taylor Fausak

# Finds the first triangle number to have over 500 divisors. This is NOT the
# fastest way to do so. Faster algorithms require pre-computing a list of primes
# which requires knowing how large the answer is before finding it.

use strict;
use warnings;

my $limit = 500;
my $triangle = -1;

for (my $n = 1; ; $n++) {
    $triangle = ($n * ($n + 1)) / 2;
    my $divisors = 2; # 1 and n

    for (my $i = 2; $i <= sqrt($triangle); $i++) {
        if ($triangle % $i == 0) {
            $divisors += 2;
        }
    }

    if ($divisors > $limit) {
        last;
    }
}

print $triangle . "\n";
