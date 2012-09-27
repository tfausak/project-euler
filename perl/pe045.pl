#!/usr/bin/perl
# http://projecteuler.net/problem=45

use strict;
use warnings;

my $lower_limit = 40755;
my $result = 0;

for (my $n = $lower_limit + 1; ; $n++) {
    $n++;

    my $c = -1 * ($n ** 2 + $n);
    my ($p1, $p2) = quadratic(3, -1, $c);
    my ($h1, $h2) = quadratic(4, -2, $c);

    if (
        (($p1 > 0 && $p1 == int($p1)) || ($p2 > 0 && $p2 == int($p2)))
        &&
        (($h1 > 0 && $h1 == int($h1)) || ($h2 > 0 && $h2 == int($h2)))
    ) {
        $result = $n * ($n + 1) / 2;
        last;
    }
}

print $result . "\n";

sub quadratic {
    my ($a, $b, $c) = @_;
    my @x;

    $x[0] = (-1 * $b - sqrt($b ** 2 - 4 * $a * $c)) / (2 * $a);
    $x[1] = (-1 * $b + sqrt($b ** 2 - 4 * $a * $c)) / (2 * $a);

    return @x;
}
