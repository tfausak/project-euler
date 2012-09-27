#!/usr/bin/perl
# http://projecteuler.net/problem=32
# Finds the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital. Products of that form must have
# exactly four digits (d * dddd = dddd or dd * ddd = dddd).

use strict;
use warnings;

my %pandigitals;
my $sum = 0;

A: foreach my $a (1 .. 99) {
    B: foreach my $b (100 .. 9999) {
        my $p = $a * $b;

        if ($p < 1000) {
            next B;
        }

        if ($p > 9999) {
            next A;
        }

        my $n = $a . $b . $p;

        if (length($n) != 9 || !pandigital($n)) {
            next;
        }

        print "$a\t* $b\t= $p\n";

        $pandigitals{$p}++;
    }
}

while (my ($p, $count) = each(%pandigitals)) {
    $sum += $p;
}

print $sum . "\n";

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
