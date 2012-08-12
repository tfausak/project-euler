#!/usr/bin/perl

# Project Euler problem 52
# by Taylor Fausak

use strict;
use warnings;

my $n = 0;

N: while (1) {
	$n++;

	if (length($n) != length(6 * $n)) {
		next;
	}

	foreach my $a (2 .. 6) {
		if (!same_digits($n, $a * $n)) {
			next N;
		}
	}

	last;
}

print $n . "\n";

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
