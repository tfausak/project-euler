#!/usr/bin/perl

# Project Euler problem 41
# by Taylor Fausak

use strict;
use warnings;

my $max = 0;

foreach my $d (1 .. 9) {
	my $s = 0;

	foreach my $n (1 .. $d) {
		$s += $n;
	}

	if ($s % 3 == 0) {
		next; # sum of digits must not be divisible by 3
	}

	my @permutations = permute(undef, (1 .. $d));

	foreach my $n (@permutations) {
		if (is_prime($n) != 0 && $n > $max) {
			$max = $n;
		}
	}
}

print $max . "\n";

sub permute {
	my ($n, @set) = @_;
	my @result;

	if ($#set == 0) {
		if (defined($n)) {
			return $n . $set[0];
		}
		else {
			return $set[0];
		}
	}

	for (my $i = 0; $i <= $#set; $i++) {
		my @subset = @set;
		my $a = splice(@subset, $i, 1);

		if (defined($n)) {
			$a = $n . $a;
		}

		push(@result, permute($a, @subset));
	}

	return @result;
}

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
