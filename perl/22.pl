#!/usr/bin/perl

# Project Euler problem 22
# by Taylor Fausak

# Finds the sum of all the name scores in the input file. A name score is
# calculated by the sum of the numerical values of the letters (A = 1,
# B = 2, ...) multiplied by the name's position in the list.

use strict;
use warnings;

my $offset = 64;
my @names;
my $sum = 0;

open INPUT, '<', '22.txt', or die $!;

foreach my $line (<INPUT>) {
	@names = split(',', $line);
}

@names = sort(@names);

for (my $i = 0; $i <= $#names; $i++) {
	my $worth = 0;

	foreach my $c (split('', $names[$i])) {
		my $ord = ord($c) - $offset;

		if ($ord < 1 || $ord > 26) {
			next; # skip anything not [A-Z]
		}

		$worth += $ord;
	}

	$sum += ($i + 1) * $worth;
}

print $sum . "\n";
