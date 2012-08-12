#!/usr/bin/perl

# Project Euler problem 46
# by Taylor Fausak

use strict;
use warnings;

my @primes = (2);
my $result;

for (my $n = 3; !$result; $n += 2) {
	if (is_prime($n)) {
		push(@primes, $n);
		next;
	}

	my $found = undef;

	foreach my $prime (@primes) {
		if ($prime >= $n) {
			last;
		}

		my $tmp = $n - $prime;

		if (($tmp & 1) == 1) {
			next; # $tmp is odd, therefore $n is even
		}

		$tmp >>= 1; # equivalent to $tmp /= 2

		my $sqrt = sqrt($tmp);

		if ($sqrt == int($sqrt)) {
			$found = 1;
			last;
		}
	}

	if (!$found) {
		$result = $n;
	}
}

print $result . "\n";

sub is_prime {
	my $n = $_[0];

	if ($n == 1) {
		return 0; # 1 is not prime
	}

	if ($n < 4) {
		return 1; # 2 and 3 are prime
	}

	if (($n & 1) == 0) {
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
