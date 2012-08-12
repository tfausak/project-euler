#!/usr/bin/perl

# Project Euler problem 3
# by Taylor Fausak

# Finds the largest prime factor of 600,851,475,143. Repeated division ensures
# that each factor found is prime.

use strict;
use warnings;

my $n = 600851475143;
my $factor;

while ($n % 2 == 0) {
    $n >>= 1; # equivalent to $n /= 2
}

for ($factor = 3; $n != 1; $factor += 2) {
    while ($n % $factor == 0) {
        $n /= $factor;
    }
}

$factor -= 2; # since the last iteration of the loop increments $factor

print $factor . "\n";
