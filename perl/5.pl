#!/usr/bin/perl

# Project Euler problem 5
# by Taylor Fausak

# Finds the smallest number evenly divisible by every number from 1 to 20.
# Determines the prime factorization of each number in the range, then
# multiplies the greatest power of each prime together.

use strict;
use warnings;

my $limit = 20;
my %factors;
my $result = 1;

for (my $n = 1; $n <= $limit; $n++) {
	my %f = factor($n);

	while (my ($factor, $power) = each(%f)) {
		if (!defined($factors{$factor}) || $power > $factors{$factor}) {
			$factors{$factor} = $power;
		}
	}
}

while (my ($factor, $power) = each(%factors)) {
	$result *= $factor ** $power;
}

print $result . "\n";

sub factor {
	my $n = $_[0];
	my %factors;

	for (my $factor = 2; $n > 1; $factor++) {
		while ($n % $factor == 0) {
			$n /= $factor;
			$factors{$factor}++;
		}
	}
	
	return %factors;
}
