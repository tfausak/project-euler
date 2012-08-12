#!/usr/bin/perl

# Project Euler problem 53
# by Taylor Fausak

use strict;
use warnings;

my $limit = 100;
my $minimum = 10 ** 6;
my $count = 0;

ROW: foreach my $row (1 .. $limit + 1) {
	my $value = 1;
	my $half = int($row / 2);
	my $odd = $row & 1;

	if ($odd) {
		$half++;
	}

	COLUMN: foreach my $column (1 .. $half) {
		if ($value > $minimum) {
			if ($odd) {
				$count += 2 * ($half - $column) + 1;
			}
			else {
				$count += 2 * ($half - $column + 1);
			}

			next ROW;
		}

		$value *= ($row - $column) / $column;
	}
}

print $count . "\n";
