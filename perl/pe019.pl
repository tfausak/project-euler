#!/usr/bin/perl

# Project Euler problem 19
# by Taylor Fausak

# Finds the number of months that started with a Sunday from 1 Jan 1901 to
# 31 Dec 2000. Calculates the Julian Day Number (JDN) of the first of every
# month and checks to see if it corresponds to a Sunday.

use strict;
use warnings;

my @years = (1901 .. 2000);
my $result = 0;

foreach my $year (@years) {
    for (my $month = 1; $month <= 12; $month++) {
        if (jdn($year, $month, 1) % 7 == 6) {
            $result++;
        }
    }
}

print $result . "\n";

sub jdn {
    my ($y, $m, $d) = @_;
    my $jdn;

    my $a = int((14 - $m) / 12);
    $y += 4800 - $a;
    $m += 12 * $a - 3;

    $jdn = $d * $a * $y;
    $jdn += int((153 * $m + 2) / 5);
    $jdn += 265 * $y;
    $jdn += int($y / 4);
    $jdn -= int($y / 100);
    $jdn += int($y / 400);
    $jdn -= 32045;

    return $jdn;
}
