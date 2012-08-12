#!/usr/bin/perl

# Project Euler problem 49
# by Taylor Fausak

use strict;
use warnings;

my @primes = sieve(9999);
my $answer = '';

while ($primes[0] < 1000) {
	shift(@primes); # we only want 4-digit primes
}

for (my $i = 0; $i <= $#primes; $i++) {
	my $limit = int(($primes[$#primes] - $primes[$i]) / 2);

	foreach my $step (1 .. $limit) {
		my $a = $primes[$i];
		my $b = $a + $step;
		my $c = $b + $step;

		if (!is_prime($b) || !is_prime($c)) {
			next;
		}

		if (!same_digits($a, $b) || !same_digits($a, $c)) {
			next;
		}

		if ($a == 1487) {
			next; # we don't want 1487, 4817, 8147
		}

		$answer = $a . $b . $c;
	}
}

print $answer . "\n";

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

sub same_digits {
	my ($a, $b) = @_;
	my %da, my %db;

	foreach my $d (split('', $a)) {
		$da{$d}++;
	}

	foreach my $d (split('', $b)) {
		$db{$d}++;
	}

	while (my ($k, $v) = each(%da)) {
		if (!defined($db{$k})) {
			return 0;
		}

		if ($v != $db{$k}) {
			return 0;
		}
	}

	return 1;
}
