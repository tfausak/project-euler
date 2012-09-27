#!/usr/bin/perl
# http://projecteuler.net/problem=55

use strict;
use warnings;

use bigint;

my $limit = 10 ** 4;
my $max_steps = 50;
my $count = 0;

foreach my $n (1 .. $limit) {
    my $steps = 1;

    for (my $l = lyrchel($n); $l != flip($l); $l = lyrchel($l)) {
        if ($steps++ > $max_steps) {
            $count++;
            last;
        }
    }
}

print $count . "\n";

sub lyrchel {
    my $n = $_[0];

    return $n + flip($n);
}

sub flip {
    my $n = $_[0];
    my $result = 0;

    for (my $p = length($n) - 1; $n >= 1; $p--) {
        $result += ($n % 10) * (10 ** $p);
        $n /= 10;
    }

    return $result;
}
