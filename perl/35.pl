#!/usr/bin/perl

# Project Euler problem 35
# by Taylor Fausak

use strict;
use warnings;

my $limit = 10 ** 6;
my @primes = sieve(10 ** 6);
my %primes;
my $count = 0;

foreach my $prime (@primes) {
	$primes{$prime} = 1;
}

foreach my $prime (@primes) {
	my $n = $prime;

	while (defined($primes{$n})) {
		$n = int($n / 10) + ($n % 10) * 10 ** (length($n) - 1);

		if ($n == $prime) {
			$count++;
			last;
		}
	}
}

print $count . "\n";

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
