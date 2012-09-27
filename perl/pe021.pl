#!/usr/bin/perl

# Project Euler problem 21
# by Taylor Fausak

# Finds the sum of all amicable numbers under 10,000. Generates an array where
# the key is the number and the value is its aliquot sum.

use strict;
use warnings;

my $limit = 10000;
my @aliquot_sums;
my $sum = 0;

for (my $n = 1; $n <= $limit; $n++) {
    $aliquot_sums[$n] = aliquot_sum($n);
}

for (my $a = 1; $a <= $#aliquot_sums; $a++) {
    my $b = $aliquot_sums[$a];

    if ($a != $b && defined($aliquot_sums[$b]) && $aliquot_sums[$b] == $a) {
        $sum += $a;
    }
}

print $sum . "\n";

sub aliquot_sum {
    my $n = $_[0];
    my $sum = 1;
    my $sqrt = int(sqrt($n));

    for (my $i = 2; $i <= $sqrt; $i++) {
        if ($n % $i == 0) {
            $sum += $i + ($n / $i);
        }
    }

    if ($n / $sqrt == $sqrt) {
        $sum -= $sqrt;
    }

    return $sum;
}
