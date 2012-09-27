#!/usr/bin/perl
# http://projecteuler.net/problem=47

use strict;
use warnings;

my $factors = 4;
my @primes;
my $count = 0;
my $n;

for ($n = 2; $count != $factors; $n++) {
    if (is_prime($n)) {
        $count = 0;
        push(@primes, $n);
        next;
    }

    my $n_ = $n;
    my $f = 0;

    foreach my $prime (@primes) {
        if ($n_ % $prime == 0) {
            $n_ /= $prime;
            $f++;
        }
    }

    if ($f != $factors) {
        $count = 0;
        next;
    }

    $count++;
}

$n -= $factors;
print $n . "\n";

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
