#!/usr/bin/env perl
# http://projecteuler.net/problem=34
# Finds the sum of all numbers equal to the sum of the factorial of their
# digits. Numbers of this form are called factorions. It's worth noting that
# there are only four factorions: 1, 2, 145, and 40585. This pre-computes all
# factorials from 0 to 9, then determines the upper limit using
#   10 ^ (d - 1) <= n <= n * 9!
# where d is the number of digits and n is the number. Once d is found, the max
# value is given by d * 9!. Since we're looking for sums, the main loop starts
# at 10 and goes to the limit, calculating the sum and comparing.

use strict;
use warnings;

my @factorial;
my $limit;
my $sum = 0;

foreach my $n (0 .. 9) {
    push(@factorial, factorial($n));
}

for (my $d = 1; 10 ** ($d - 1) <= $d * $factorial[9]; $d++) {
    $limit = $factorial[9] * $d;
}

MAIN: foreach my $n (10 .. $limit) {
    my $tmp = $n;
    my $s = 0;

    while ($tmp >= 1) {
        $s += $factorial[$tmp % 10];
        $tmp /= 10;
    }

    if ($s == $n) {
        $sum += $s;
    }
}

print $sum . "\n";

sub factorial {
    my $n = $_[0];
    my $result = 1;

    while ($n > 1) {
        $result *= $n--;
    }

    return $result;
}
