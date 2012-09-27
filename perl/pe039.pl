#!/usr/bin/perl

# Project Euler problem 39
# by Taylor Fausak

use strict;
use warnings;

my $limit = 1000;
my %triplets;
my @perimeters;
my $max = my $max_p = 0;

foreach my $m (1 .. $limit) {
    foreach my $n (1 .. $m - 1) {
        for (my $k = 1; ; $k++) {
            my $p = $k * 2 * $m * ($m + $n);

            if ($p > $limit) {
                last;
            }

            my $a = $k * 2 * $m * $n;
            my $b = $k * ($m ** 2 - $n ** 2);
            my $c = $k * ($m ** 2 + $n ** 2);

            if ($a > $b) {
                ($a, $b) = ($b, $a);
            }

            $triplets{'a' . $a . 'b' . $b . 'c' . $c} = $p;
        }
    }
}

while (my ($triplet, $perimeter) = each(%triplets)) {
    $perimeters[$perimeter]++;
}

for (my $perimeter = 0; $perimeter <= $#perimeters; $perimeter++) {
    if (!defined($perimeters[$perimeter])) {
        next;
    }

    if ($perimeters[$perimeter] > $max) {
        $max = $perimeters[$perimeter];
        $max_p = $perimeter;
    }
}

print $max_p . "\n";
