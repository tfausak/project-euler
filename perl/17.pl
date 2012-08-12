#!/usr/bin/perl

# Project Euler problem 17
# by Taylor Fausak

# Finds the number of letters used if the numbers from 1 to 1000 were written
# out in words.

use strict;
use warnings;

my $limit = 1000;
my $total = 0;

my @ones = (
	4,	# zero
	3,	# one
	3,	# two
	5,	# three
	4,	# four
	4,	# five
	3,	# six
	5,	# seven
	5,	# eight
	4	# nine
);

my @teens = (
	3,	# ten
	6,	# eleven
	6,	# twelve
	8,	# thirteen
	8,	# fourteen
	7,	# fifteen
	7,	# sixteen
	9,	# seventeen
	8,	# eighteen
	8	# nineteen
);

my @tens = (
	0,
	0,
	6,	# twenty
	6,	# thirty
	5,	# forty
	5,	# fifty
	5,	# sixty
	7,	# seventy
	6,	# eighty
	6	# ninety
);

for (my $n = 1; $n <= $limit; $n++) {
	$total += letters($n);
}

print $total . "\n";

sub letters {
	my $n = $_[0];
	my $total = 0;

	if ($n < 10) {
		$total += $ones[$n];
	}
	elsif ($n < 20) {
		$total += $teens[$n % 10];
	}
	elsif ($n < 100) {
		$total += $tens[int($n / 10)];

		if ($n % 10 != 0) {
			$total += $ones[$n % 10];
		}
	}
	elsif ($n < 1000) {
		$total += $ones[int($n / 100)];
		$total += 7;

		if ($n % 100 != 0) {
			$total += 3;
			$total += letters($n % 100);
		}
	}
	elsif ($n == 1000) {
		$total += 11;
	}

	return $total;
}
