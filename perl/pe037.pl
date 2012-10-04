#!/usr/bin/env perl
# http://projecteuler.net/problem=37

use strict;
use warnings;

my $limit = 739397; # analytical way to determine upper bound?
my @primes = sieve($limit);
my $sum = 0;

splice(@primes, 0, 4); # remove one-digit primes

PRIME: foreach my $n (@primes) {
    my $l = '';
    my $r = $n;

    while ($r >= 1) {
        $l = ($r % 10) . $l;
        $r = int($r / 10);

        if (!is_prime($l) || !is_prime($r)) {
            next PRIME;
        }
    }

    $sum += $n;
}

print $sum . "\n";

sub sieve {
    my $limit = $_[0];
    my $sieve_bound = ($limit - 1) / 2;
    my $cross_limit = (sqrt($limit) - 1) / 2;
    my @sieve;
    my @primes = (2);

    foreach my $i (1 .. $cross_limit) {
        if (defined($sieve[$i])) {
            next;
        }

        for (my $j = 2 * $i * ($i + 1); $j <= $sieve_bound; $j += 2 * $i + 1) {
            $sieve[$j] = 1;
        }
    }

    for (my $i = 1; $i <= $sieve_bound; $i++) {
        if (defined($sieve[$i])) {
            next;
        }

        push(@primes, 2 * $i + 1);
    }

    return @primes;
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
