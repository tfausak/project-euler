#!/usr/bin/perl

# Project Euler problem 6
# by Taylor Fausak

# Finds the difference between the sum of squares of the first 100 natural
# numbers and the square of the sum. The sum of the natural numbers from 1 to n
# is given by
#   S(n) = n * (n + 1) / 2
# and the sum of the squares of the natural numbers from 1 to n is given by
#   S(n) = n * (n + 1) * (2 * n + 1) / 6

use strict;
use warnings;

my $n = 100;
my $result = 0;

$result += ($n * ($n + 1) / 2) ** 2;
$result -= $n * ($n + 1) * (2 * $n + 1) / 6;

print $result . "\n";
