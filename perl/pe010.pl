#!/usr/bin/env perl
# http://projecteuler.net/problem=10
# Finds the sum of all the primes below two million. Uses the Sieve of
# Eratosthenes on odd numbers. I can't take credit for the algorithm; it's from
# the Project Euler PDF.

use strict;
use warnings;

my $limit = 2000000;
my $sum = 0;
my @primes = sieve($limit);

foreach my $prime (@primes) {
    $sum += $prime;
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
