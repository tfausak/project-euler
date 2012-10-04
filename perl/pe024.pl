#!/usr/bin/env perl
# http://projecteuler.net/problem=24

use strict;
use warnings;

my @set = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
my $term = 1000000;

print term($term, @set) . "\n";

sub term {
    my ($n, @set) = @_;
    $n--;
    my $fact = factorial($#set); # $#set gives (size of the set) - 1

    if ($#set == 0) {
        return $set[0]; # solved if the set only has one element
    }

    my $e = splice(@set, int($n / $fact), 1);

    return $e . term(($n % $fact) + 1, @set);
}

sub factorial {
    my $n = $_[0];
    my $result = 1;

    foreach my $i (1 .. $n) {
        $result *= $i;
    }

    return $result;
}
