#!/usr/bin/perl

# Project Euler problem 40
# by Taylor Fausak

use strict;
use warnings;

my $limit = 1000000;
my $fraction = '';
my $product = 1;

foreach my $n (1 .. $limit) {
    $fraction .= $n;
}

foreach my $p (0 .. 6) {
    $product *= substr($fraction, 10 ** $p - 1, 1);
}

print $product . "\n";
