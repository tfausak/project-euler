#!/usr/bin/perl
# http://projecteuler.net/problem=27

use strict;
use warnings;

my $limit = 1000;
my %primes = sieve($limit);
my $max_n = 0;
my $max_a = 0;
my $max_b = 0;
my $product = 0;

A: foreach my $a (-1 * $limit .. $limit) {
    B: foreach my $b (-1 * $limit .. $limit) {
        my $n = 0;

        while (defined($primes{$n ** 2 + $a * $n + $b})) {
            $n++;
        }

        if ($n > $max_n) {
            $max_n = $n;
            $max_a = $a;
            $max_b = $b;
        }
    }
}

$product = $max_a * $max_b;

print $product . "\n";

sub sieve {
    my $limit = $_[0];
    my $sieve_bound = ($limit - 1) / 2;
    my $cross_limit = (sqrt($limit) - 1) / 2;
    my @sieve;
    my %primes = (2 => 1);

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

        $primes{2 * $i + 1} = 1;
    }

    return %primes;
}
