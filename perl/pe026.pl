#!/usr/bin/perl
# http://projecteuler.net/problem=26
# Finds the value of d < 1000 for which 1 / d contains the longest recurring
# cycle. Sieves to find all the primes under the limit. Starting from the
# largest prime, searches for a full reptend prime ("a prime p is full reptend
# iff 10 is a primitive root modulo p"). If prime p is full reptend, then 1 / p
# will have p - 1 repeating digits.

# I'm sure a faster method for determining if a prime is full reptend exists.

use strict;
use warnings;

use bigint;

my $limit = 100000;
my @primes = reverse(sieve($limit));
my $d = 0;

foreach my $p (@primes) {
    my %tmp;

    foreach my $k (1 .. $p - 1) {
        my $mod = (10 ** $k) % $p;

        if (defined($tmp{$mod})) {
            last;
        }

        $tmp{$mod} = 1;
    }

    if (keys(%tmp) == $p - 1) {
        $d = $p;
        last;
    }
}

print $d . "\n";

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
