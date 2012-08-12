#!/usr/bin/perl

# Project Euler problem 38
# by Taylor Fausak

use strict;
use warnings;

my $max = 0;

M: for (my $m = 1; $m < 10 ** 4; $m++) {
    N: for (my $n = 2; $n <= 9; $n++) {
        if (length($m) * $n + $n - 1 > 9) {
            next M;
        }

        my $c = '';

        foreach my $a (1 .. $n) {
            $c .= $m * $a;
        }

        if (length($c) != 9 || !pandigital($c)) {
            next N;
        }

        if ($c > $max) {
            $max = $c;
        }
    }
}

print $max . "\n";

sub pandigital {
    my $n = $_[0];
    my $length = length($n);

    if ($length < 1 || $length > 9) {
        return 0;
    }

    my %digits;

    while ($n >= 1) {
        $digits{$n % 10}++;
        $n /= 10;
    }

    if ($length != keys(%digits)) {
        return 0;
    }

    while (my ($digit, $count) = each(%digits)) {
        if ($digit < 1 || $digit > $length || $count > 1) {
            return 0;
        }
    }

    return 1;
}
