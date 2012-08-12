#!/usr/bin/perl

# Project Euler problem 2
# by Taylor Fausak

# Finds the sum of all even Fibonacci terms less than four million. Every third
# term of the Fibonacci series is odd. That is, if x and y are odd, then the
# series is
# 	x, y, x + y, x + (2 * y), (2 * x) + (3 * y), ...

use strict;
use warnings;

my $limit = 4000000;
my $x = my $y = 1;
my $sum = 0;

while ($x <= $limit) {
	$sum += $x + $y;
	($x, $y) = ($x + 2 * $y, 2 * $x + 3 * $y);
}

print $sum . "\n";
