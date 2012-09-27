#!/usr/bin/perl
# http://projecteuler.net/problem=50

use strict;
use warnings;

my $limit = 10 ** 6;
my @primes = sieve($limit);
my $max_terms = my $result = my $tmp = 0;

for (my $i = 0; $i <= $#primes; $i++) {
    my $tmp += $primes[$i];
    my $sum = $tmp;

    for (my $j = $i + 1; $j <= $#primes; $j++) {
        $sum += $primes[$j];

        if ($sum >= $limit) {
            last;
        }

        if (!is_prime($sum)) {
            next;
        }

        if ($j - $i > $max_terms) {
            $max_terms = $j - $i;
            $result = $sum;
        }
    }
}

print $result . "\n";

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
