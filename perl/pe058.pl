#!/usr/bin/env perl
# http://projecteuler.net/problem=58
# Similar to problem 28.
#   bottom right: n^2
#   bottom left: n^2 - (n- 1)
#   top left: n^2 - 2 * (n -1)
#   top right: n^2 - 3 * (n - 1)

use strict;
use warnings;

my $n = 0; # numerator (i.e., number of primes on the diagonals)
my $d = 5; # denominator (i.e., number of numbers on the diagonals)
my $ratio = 1.0;
my $s = 3; # side length

while ($ratio >= 0.1) {
    my $bl = ($s * $s) - ($s - 1);
    my $tl = $bl - ($s - 1);
    my $tr = $tl - ($s - 1);

    $n += is_prime($bl);
    $n += is_prime($tr);
    $n += is_prime($tl);

    $ratio = $n / $d;

    $d += 4;
    $s += 2;
}

$s -= 2; # last iteration increments $s

print $s . "\n";

sub is_prime {
    my $n = $_[0];

    if ($n == 1) {
        return 0; # 1 is not prime
    }

    if ($n < 4) {
        return 1; # 2 and 3 are prime
    }

    if (($n & 1) == 0) {
        return 0; # multiples of 2 are not prime
    }

    if ($n < 9) {
        return 1; # 4, 6, and 8 have already been excluded
    }

    if ($n % 3 == 0) {
        return 0; # multiples of 3 are not prime
    }

    # all remaining primes have the form 6k +/- 1
    for (my $f = 5; $f <= sqrt($n); $f += 6) {
        if ($n % $f == 0) {
            return 0; # 6k - 1
        }

        if ($n % ($f + 2) == 0) {
            return 0; # 6k + 1
        }
    }

    return 1;
}
