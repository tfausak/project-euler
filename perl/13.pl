#!/usr/bin/perl

# Project Euler problem 13
# by Taylor Fausak

# Finds the first ten digits of the sum of a bunch of 50-digit numbers. Avoids
# dealing with big integers by making a 2-dimensional array of digits. Given
# some numbers (call them a, b, ..., z), with n digits (an, ..., a2, a1)
# 	a = an ... a2 a1, b = bn ... b2 b1, ..., z = zn ... z2 z1
# then the array produced would be
# 	a1	b1	...	z1
# 	a2	b2	...	z2
# 	...	...	...	...
# 	an	bn	...	zn
# This is slightly confusing but done to improve performance, as digits are read
# across a row instead of down a column.

use strict;
use warnings;

my $digits = 10;
my @numbers;
my @sum;
my $n = 0;
my $result = '';

open(INPUT, '<', $ARGV[0]) or die $!;

# Read input and populate array
while (my $line = <INPUT>) {
	$line =~ s/^\s*(\d+)\s*$/$1/; # trim whitespace

	my @digits = reverse(split('', $line)); # least-significant digit first

	for (my $d = 0; $d <= $#digits; $d++) {
		$numbers[$d][$n] = $digits[$d];
	}

	$n++;
}

close(INPUT) or die $!;

# Make $sum[$d] the sum of the $dth digit of every number
for (my $d = 0; $d <= $#numbers; $d++) {
	for (my $n = 0; $n <= $#{$numbers[$d]}; $n++) {
		$sum[$d] += $numbers[$d][$n];
	}
}
# At this point, elements of @sum probably have more than one digit

# Make every element of @sum have one digit, adding to the next column as needed
for (my $d = 0; $d <= $#sum; $d++) {
	my $n = $sum[$d];
	my $offset = 1;

	$sum[$d] = $n % 10;
	$n /= 10;

	while ($n >= 1) {
		$sum[$d + $offset++] += $n % 10;
		$n /= 10;
	}
}

for (my $i = $#sum; $i > $#sum - $digits; $i--) {
	if (!defined($sum[$i])) {
		next;
	}

	$result .= $sum[$i];
}

print $result . "\n";
