#!/usr/bin/perl
# http://projecteuler.net/problem=11
# Finds the greatest product of four adjacent numbers in any direction. Starting
# at the top left, only four directions need to be checked at each point: right,
# down, down-right, and down-left.

use strict;
use warnings;

my @grid;
my $size = 4;
my $max = -1;

open(INPUT, '<', $ARGV[0]) or die($!);

while (my $line = <INPUT>) {
    $line =~ s/^\s*(\d+)\s*$/$1/; # trim whitespace
    push(@grid, [split(' ', $line)]);
}

close(INPUT) or die $!;

for (my $i = 0; $i <= $#grid; $i++) {
    for (my $j = 0; $j <= $#{$grid[$i]}; $j++) {
        if ($i + $size > $#grid || $j + $size > $#{$grid[$i]} || $j - $size < 0) {
            next;
        }

        my $a = my $b = my $c = my $d = $grid[$i][$j];

        for (my $k = 1; $k < $size; $k++) {
            $a *= $grid[$i][$j + $k];
            $b *= $grid[$i + $k][$j];
            $c *= $grid[$i + $k][$j + $k];
            $d *= $grid[$i + $k][$j - $k];
        }

        $max = ($a > $max) ? $a : $max;
        $max = ($b > $max) ? $b : $max;
        $max = ($c > $max) ? $c : $max;
        $max = ($d > $max) ? $d : $max;
    }
}

print $max . "\n";
