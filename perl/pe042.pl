#!/usr/bin/perl
# http://projecteuler.net/problem=42

use strict;
use warnings;

my $offset = 64;
my @words;
my $count = 0;

open(INPUT, '<', $ARGV[0]) or die($!);

foreach my $line (<INPUT>) {
    @words = split(',', $line);
}

for (my $i = 0; $i <= $#words; $i++) {
    my $value = 0;

    foreach my $c (split('', $words[$i])) {
        my $ord = ord($c) - $offset;

        if ($ord < 1 || $ord > 26) {
            next; # skip anything not [A-Z]
        }

        $value += $ord;
    }

    my $test = sqrt(8 * $value + 1);

    if ($test == int($test)) {
        $count++;
    }
}

print $count . "\n";
