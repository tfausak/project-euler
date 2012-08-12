#!/usr/bin/perl

# Project Euler problem 243
# by Taylor Fausak

use strict;
use warnings;

my @hcn;
@hcn = (2, 4, 6, 12, 24, 36, 48, 60, 120, 180);
#@hcn = (240, 360, 720, 840, 1260, 1680, 2520, 5040, 7560, 10080);
#@hcn = (15120, 20160, 25200, 27720, 45360, 50400, 55440, 83160, 110880, 166320);
#@hcn = (221760, 277200, 332640, 498960, 554400, 665280, 720720, 1081080, 1441440, 2162160);
#@hcn = (2882880, 3603600, 4324320, 6486480, 7207200, 8648640, 10810800, 14414400, 17297280, 21621600);
my @primes = sieve(245044800);

print $#primes . "\n";

sub sieve {
	my $limit = $_[0];
	my $sieve_bound = ($limit - 1) / 2;
	my $cross_limit = (sqrt($limit) - 1) / 2;
	my @sieve;
	my @primes = (2);

	foreach my $i (1 .. $cross_limit) {
		if (defined($sieve[$i])) {
			next;
		}

		for (my $j = 2 * $i * ($i + 1); $j <= $sieve_bound; $j += 2 * $i + 1) {
			$sieve[$j] = 1;
		}
	}

	for (my $i = 1; $i <= $sieve_bound; $i++) {
		if (defined($sieve[$i])) {
			next;
		}

		push(@primes, 2 * $i + 1);
	}

	return @primes;
}

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

sub resilience {
	my $d = $_[0];
	my $r = 0;

	foreach my $n (1 .. $d - 1) {
		if (is_resilient($n, $d)) {
			$r++;
		}
	}

	return $r;
}

sub is_resilient {
	my ($n, $d) = @_;

	if (gcd($n, $d) != 1) {
		return undef;
	}

	return 1;
}

sub gcd {
	my ($a, $b) = @_;

	if ($a == 0 || $b == 0) {
		return $a | $b;
	}

	while ($b != 0) {
		($a, $b) = ($b, $a % $b);
	}

	return $a;
}
