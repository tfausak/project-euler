#!/usr/bin/perl

# Project Euler problem 97
# by Taylor Fausak

# Finds the last 10 digits of 28433 * 2 ^ 7830457 + 1.

use strict;
use warnings;

my $digits = 10;
my $n = 1;
my $d = 10 ** $digits;

foreach (1 .. 7830457) {
	$n <<= 1;
	$n = $n % $d;
}

$n = ($n * 28433) % $d;
$n = ($n + 1) % $d;

print $n . "\n";
