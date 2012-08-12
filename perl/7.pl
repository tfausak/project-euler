#!/usr/bin/perl

# Project Euler problem 7
# by Taylor Fausak

# Finds the 10,001st prime number. Uses the following facts:
# 	1 is not prime
# 	All primes except 2 are odd
# 	All primes greater than 3 can be written in the form 6k +/- 1
# I can't take credit for the algorithm; it's from the Project Euler PDF.

use strict;
use warnings;

my $limit = 10001;
my $count = 1; # 2 is prime
my $n = 1;

while ($count < $limit) {
	$n += 2;

	if (is_prime($n) == 1) {
		$count++;
	}
}

print $n . "\n";

sub is_prime {
	my $n = $_[0];

	if ($n == 1) {
		return 0; # 1 is not prime
	}

	if ($n < 4) {
		return 1; # 2 and 3 are prime
	}

	if ($n % 2 == 0) {
		return 0; # multiples of 2 are not prime
	}

	if ($n < 9) {
		return 1; # 4, 6, and 8 have already been excluded
	}

	if ($n % 3 == 0) {
		return 0; # multiples of 3 are not prime
	}

	# all remaining primes have the form 6k +/- 1
	for (my $f = 5; $f <= sqrt($n); $f += 6) {
		if ($n % $f == 0) {
			return 0; # 6k - 1
		}

		if ($n % ($f + 2) == 0) {
			return 0; # 6k + 1
		}
	}

	return 1;
}
