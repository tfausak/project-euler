#!/usr/bin/env perl
# http://projecteuler.net/problem=92

use strict;
use warnings;

my $limit = (10 ** 7) - 1;
my %last;
my $count = 0;

foreach my $n (1 .. $limit) {
    my $term = $n;
    my @chain;

    while ($term != 1 && $term != 89) {
        if (defined($last{$term})) {
            $term = $last{$term};

            last;
        }

        push(@chain, $term);

        $term = square_of_digits($term);
    }

    if ($term == 89) {
        $count++;
    }

    foreach my $y (@chain) {
        $last{$y} = $term;
    }
}

print $count . "\n";

sub square_of_digits {
    my $n = $_[0];
    my $sum = 0;

    while ($n >= 1) {
        $sum += ($n % 10) ** 2;
        $n = int($n / 10);
    }

    return $sum;
}
