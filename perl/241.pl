#!/usr/bin/perl

# Project Euler problem 241
# by Taylor Fausak

use strict;
use warnings;

my @perfect = (2, 24, 4320, 4680, 26208);

foreach my $n (@perfect) {
	my @divisors = divisors($n);
	my $sum = 0;
	foreach my $d (@divisors) {
		$sum += $d;
	}
	my %f1 = factor($n);
	my %f2 = factor($sum);

	print "\n$n\n";
	print "\tPrime factorization of n: ";
	while (my ($factor, $power) = each(%f1)) {
		print "$factor^$power ";
	}
	print "\n";
	print "\tDivisors: @divisors\n";
	print "\tSum of divisors: $sum\n";
	print "\tPrime factorization of the sum of divisors: ";
	while (my ($factor, $power) = each(%f2)) {
		print "$factor^$power ";
	}
	print "\n";
}

exit 0;

print "n\tsigma\tk\tprime factorization\n";

for (my $n = 2; $n < 10 ** 6; $n += 2) {
	my $sigma = sigma($n);
	my $k = $sigma / $n - 0.5;

	if ($k != int($k)) {
		next;
	}

	my %factors = factor($n);

	print "$n\t$sigma\t$k\t";
	while (my ($factor, $power) = each(%factors)) {
		print "$factor^$power ";
	}
	print "\n";
}

sub digital_root {
	my $n = $_[0];
	my $sum = 0;

	if ($n < 10) {
		return $n;
	}

	foreach my $digit (split('', $n)) {
		$sum += $digit;
	}

	return digital_root($sum);
}

sub divisors {
	my $n = $_[0];
	my @divisors;

	for (my $i = 1; $i <= sqrt($n); $i++) {
		if ($n % $i == 0) {
			push(@divisors, $i);

			if ($n / $i != $i) {
				push(@divisors, $n / $i);
			}
		}
	}

	return @divisors;
}

sub sigma {
	my $n = $_[0];
	my $sum = 1 + $n;
	my $sqrt = int(sqrt($n));

	for (my $i = 2; $i <= $sqrt; $i++) {
		if ($n % $i == 0) {
			$sum += $i + ($n / $i);
		}
	}

	if ($n / $sqrt == $sqrt) {
		$sum -= $sqrt;
	}

	return $sum;
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
