#!/usr/bin/perl
# http://projecteuler.net/problem=51

use strict;
use warnings;

my @primes;

# Generate all the 5-digit primes
foreach my $n (10000 .. 99999) {
    if (!is_prime($n)) {
        next;
    }

    push(@primes, $n);
}

sub is_prime {
    my $n = $_[0];

    if ($n == 1) {
        return 0; # 1 is not prime
    }

    if ($n < 4) {
        return 1; # 2 and 3 are prime
    }

    if ($n % 2 == 0) {
        return 0; # multiples of 2 are not prime
    }

    if ($n < 9) {
        return 1; # 4, 6, and 8 have already been excluded
    }

    if ($n % 3 == 0) {
        return 0; # multiples of 3 are not prime
    }

    # all remaining primes have the form 6k +/- 1
    for (my $f = 5; $f <= sqrt($n); $f += 6) {
        if ($n % $f == 0) {
            return 0; # 6k - 1
        }

        if ($n % ($f + 2) == 0) {
            return 0; # 6k + 1
        }
    }

    return 1;
}
