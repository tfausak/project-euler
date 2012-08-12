#!/usr/bin/perl

use strict;
use warnings;

my $max = my $answer = 0;
my $l = 1;

open(INPUT, '<', $ARGV[0]) or die $!;

while (my $line = <INPUT>) {
	my ($a, $b) = split(',', $line);

	if ($b * log($a) > $max) {
		$max = $b * log($a);
		$answer = $l;
	}

	$l++;
}

close(INPUT) or die $!;

print $answer . "\n";
