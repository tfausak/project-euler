#!/usr/bin/perl
# http://projecteuler.net/problem=81

use strict;
use warnings;

my @matrix;

open(INPUT, '<', $ARGV[0]) or die($!);

foreach my $row (<INPUT>) {
    chomp($row);
    push(@matrix, [split(',', $row)]);
}

close INPUT or die $!;

foreach my $i (0 .. $#matrix) {
    foreach my $j (0 .. $#{$matrix[$i]}) {
        print $matrix[$i][$j] . ' ';
    }

    print "\n";
}
