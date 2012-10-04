#!/usr/bin/env perl
# http://projecteuler.net/problem=4
# Finds the largest palindromic number that is the product of two three-digit
# numbers. At least one operand must be a multiple of 11, since
#   abccba = 11 * (9091 * a + 910 * b + 100 * c)
# where a, b, and c are digits.

use strict;
use warnings;

my $max = 0;

# 999 is the largest integer <= 1000 evenly divisible by 3
for (my $i = 999; $i >= 100; $i--) {
    # 990 is the largest integer <= 1000 evenly divisible by 11
    for (my $j = 990; $j >= 100; $j -= 11) {
        my $product = $i * $j;

        if ($product < $max) {
            last;
        }
        elsif ($product == reverse($product)) {
            $max = $product;
        }
    }
}

print $max . "\n";
