#!/usr/bin/perl

# Project Euler problem 31
# by Taylor Fausak

use strict;
use warnings;

my $sum = 200;
my @coins = (1, 2, 5, 10, 20, 50, 100, 200);
my @ways = (1); # there's one way to make 0

foreach my $coin (@coins) {
    foreach my $n ($coin .. $sum) {
        $ways[$n] += $ways[$n - $coin];
    }
}

print $ways[$sum] . "\n";
