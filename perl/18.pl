#!/usr/bin/perl

# Project Euler problems 18 & 67
# by Taylor Fausak

use strict;
use warnings;

my @triangle;

open INPUT, '<', $ARGV[0], or die $!;

foreach my $row (<INPUT>) {
	push(@triangle, [split(' ', $row)]);
}

close INPUT or die $!;

for (my $r = $#triangle; $r > 0; $r--) {
	for (my $c = 0; $c < $#{$triangle[$r]}; $c++) {
		my $a = $triangle[$r][$c];
		my $b = $triangle[$r][$c + 1];

		if ($a > $b) {
			$triangle[$r - 1][$c] += $a;
		}
		else {
			$triangle[$r - 1][$c] += $b;
		}
	}
}

if (!defined($triangle[0][0])) {
	exit 1;
}

print $triangle[0][0] . "\n";
