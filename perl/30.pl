#!/usr/bin/perl

# Project Euler problem 30
# by Taylor Fausak

# Finds the sum of all the numbers that can be written as the sum of fifth
# powers of their digits. A number n is the sum of its digits raised to the
# power m iff
# 	n = sum(1, k) di^m
# where k is the number of digits and di is the ith digit (d1 being the least
# significant and dk being the most significant). The upper bound for numbers of
# this form is given by (b is the base, which is 10 in this case)
# 	k * (b - 1)^m = b^(k - 1)
# which cannot be solved explicitly for k. Using a calculator, k = 6.5, so we
# only need to check up k * (b - 1)^m or 6 * 9^5.

use strict;
use warnings;

my $power = 5;
my $sum = 0;
my @powers;
my $limit = 6 * 9 ** $power;

foreach my $d (0 .. 9) {
	$powers[$d] = $d ** $power; # pre-compute powers
}

foreach my $n (10 .. $limit) {
	my $tmp = 0;

	foreach my $d (split('', $n)) {
		$tmp += $powers[$d];
	}

	if ($n != $tmp) {
		next;
	}

	$sum += $n;
}

print $sum . "\n";
