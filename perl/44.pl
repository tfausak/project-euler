#!/usr/bin/perl

# Project Euler problem 44
# by Taylor Fausak

use strict;
use warnings;

my @pentagonal;

foreach my $n (1 .. 10000) {
	push(@pentagonal, $n * (3 * $n - 1) / 2);
}

foreach my $i (0 .. $#pentagonal) {
	foreach my $j ($i + 1 .. $#pentagonal) {
		if ($i == $j) {
			next;
		}

		my $sum = $pentagonal[$i] + $pentagonal[$j];
		my $difference = abs($pentagonal[$i] - $pentagonal[$j]);

		if (!pentagonal($sum) || !pentagonal($difference)) {
			next;
		}

		print "$i\t$j\t$sum\t$difference\n";
	}
}

sub pentagonal {
	my $x = $_[0];

	my $n = sqrt(24 * $x + 1) + 1;
	$n /= 6;

	return $n == int($n);
}
