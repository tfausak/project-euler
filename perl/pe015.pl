#!/usr/bin/env perl
# http://projecteuler.net/problem=15
# Finds the number of routes (without backtracking) along the edges of a
# 20x20 grid. For an nxn grid, the number of routes is the center number of
# the (2n + 1)th row of Pascal's triangle. That value can be solved for
# iteratively using v(c) = (r - c) / c, with r = row and c = column.

use strict;
use warnings;

my $size = 20;
my $row = (2 * $size) + 1;
my $routes = 2 * $size;

for (my $i = 2; $i <= $size; $i++) {
    $routes *= ($row - $i) / $i;
}

print $routes . "\n";
