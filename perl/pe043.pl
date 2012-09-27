#!/usr/bin/perl

# Project Euler problem 43
# by Taylor Fausak

use strict;
use warnings;

my @pandigitals = permute(undef, (0 .. 9));
my @primes = (2, 3, 5, 7, 11, 13, 17);
my $sum = 0;

N: foreach my $n (@pandigitals) {
    S: for (my $s = 6; $s >= 0; $s--) {
        if (substr($n, $s + 1, 3) % $primes[$s] != 0) {
            next N;
        }
    }

    $sum += $n;
}

print $sum . "\n";

sub permute {
    my ($n, @set) = @_;
    my @result;

    if ($#set == 0) {
        if (defined($n)) {
            return $n . $set[0];
        }
        else {
            return $set[0];
        }
    }

    for (my $i = 0; $i <= $#set; $i++) {
        my @subset = @set;
        my $a = splice(@subset, $i, 1);

        if (defined($n)) {
            $a = $n . $a;
        }

        push(@result, permute($a, @subset));
    }

    return @result;
}
