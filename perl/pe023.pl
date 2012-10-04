#!/usr/bin/env perl
# http://projecteuler.net/problem=23
# Finds the sum of all the positive integers which cannot be written as the
# sum of two abundant numbers. The aliquot sum of an abundant number is
# greater than the number. The sum of all the integers from 1 to n is
#   S(n) = n * (n + 1) / 2
# This builds an array of abundant numbers, then builds an array of their
# sums. These arrays are used like sets (i.e., no repeats).

use strict;
use warnings;

my $limit = 20161;
my @abundant;
my @pairs;
my $sum = $limit * ($limit + 1) / 2;

for (my $n = 1; $n <= $limit; $n++) {
    if (defined($abundant[$n])) {
        next;
    }

    my $aliquot_sum = aliquot_sum($n);

    if ($aliquot_sum >= $n) {
        if ($aliquot_sum != $n) {
            $abundant[$n] = 1;
        }

        for (my $m = 2; $m <= $limit / $n; $m++) {
            $abundant[$n * $m] = 1;
        }
    }
}

my @tmp;
for (my $i = 0; $i <= $#abundant; $i++) {
    if (defined($abundant[$i])) {
        push(@tmp, $i);
    }
}
@abundant = @tmp;

for (my $i = 0; $i <= $#abundant; $i++) {
    for (my $j = $i; $j <= $#abundant; $j++) {
        my $ij = $abundant[$i] + $abundant[$j];

        if ($ij > $limit) {
            last;
        }

        $pairs[$ij] = 1;
    }
}

for (my $i = 0; $i <= $#pairs; $i++) {
    if (defined($pairs[$i])) {
        $sum -= $i;
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
