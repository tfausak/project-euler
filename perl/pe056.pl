#!/usr/bin/perl

# Project Euler problem 56
# by Taylor Fausak

use strict;
use warnings;

use bigint;

my $limit = 100;
my $max = 0;

A: for (my $a = $limit - 1; $a > 0; $a--) {
    B: for (my $b = $limit - 1; $b > 0; $b--) {
        my $p = 1;
        my $s = 0;

        foreach (1 .. $b) {
            $p *= $a; # $a ** $b doesn't work properly with bigint
        }

        if ($max != 0 && length($p) * 9 < $max) {
            next A;
        }

        foreach my $d (split('', $p)) {
            $s += $d;
        }

        if ($s > $max) {
            $max = $s;
        }
    }
}

print $max . "\n";
