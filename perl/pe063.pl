#!/usr/bin/perl

use strict;
use warnings;

use bigint;

my $count = 0;

for (my $n = 1; $n <= 22; $n++) {
    foreach my $b (1 .. 9) {
        my $tmp = $b ** $n;

        if (length($tmp) < $n) {
            next;
        }

        if (length($tmp) > $n) {
            last;
        }

        $count++;
    }
}

print $count . "\n";
