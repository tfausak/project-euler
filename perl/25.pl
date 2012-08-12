#!/usr/bin/perl

# Project Euler problem 25
# by Taylor Fausak

# Finds the first term in the Fibonacci sequence with 1000 digits. A number
# with n digits is greater than 10^(n-1). The nth Fibonacci number, F(n),
# is given by
# 	F(n) = floor(phi^n / sqrt(5) + 1 / 2)
# Setting F(n) equal to 10^(d - 1), where d is the number of digits, and
# solving for n (ignoring the +1/2 term, since it just rounds) gives
# 	n = ((d - 1) + log(5) / 2) / log(phi)
# where log(n) is the base-10 logarithm of n.

use strict;
use warnings;

my $digits = 1000;
#my $phi = (1 + sqrt(5)) / 2;
#my $n = (($digits - 1) + log(5) / (2 * log(10))) / (log($phi) / log(10));
#my $n = ($digits - 1 + 0.5 * log(5) / log(10)) / (log(1 + sqrt(5)) / log(10) - log(2) / log(10));
my $n = (log(10) * ($digits - 1) + 0.5 * log(5)) / (log(1 + sqrt(5)) - log(2));
$n = int($n + 0.5);

print $n . "\n";
