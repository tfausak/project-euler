#!/usr/bin/perl

# Project Euler problem 28
# by Taylor Fausak

# Finds the sum of both diagonals in a 1001x1001 numerical spiral. By
# mathematical analysis, the numbers in the corners of an n-by-n spiral are
#   top right: n^2
#   top left: n^2 - (n- 1)
#   bottom left: n^2 - 2 * (n -1)
#   bottom right: n^2 - 3 * (n - 1)
# Summing and simplifying gives the sum of the outer 4 numbers of an n-by-n
# sprial as
#   4 * n^2 - 6 * n - 6

use strict;
use warnings;

my $size = 1001; # must be odd
my $sum = 1;

for (my $n = 3; $n <= $size; $n += 2) {
    $sum += (4 * $n * $n) - (6 * $n) + 6;
}

print $sum . "\n";
