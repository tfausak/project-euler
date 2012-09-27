#!/usr/bin/perl
# http://projecteuler.net/problem=33

use strict;
use warnings;

for (my $d = 3; $d <= 9; $d += 3) {
    foreach my $q (2 .. $d - 1) {
        foreach my $p (1 .. $q - 1) {
            print $p . $d . ' / ' . $d . $q . "\n";
        }
    }
}
