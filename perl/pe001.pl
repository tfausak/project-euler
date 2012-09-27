#!/usr/bin/perl
# http://projecteuler.net/problem=1
# Finds the sum of all the multiples of 3 or 5 below 1,000. If a1 is the first
# term and d is the common difference, the sum of the arithmetic progression is
#   S(n) = n * (2 * a1 + (n - 1) * d) / 2

use strict;
use warnings;

my ($limit, @numbers) = @ARGV;
my @add, my @subtract;
my $sum = 0;

if (!defined($limit) || !@numbers) {
    print 'Usage: 1.pl LIMIT NUMBER[ NUMBER[ ...]]' . "\n";
    exit(1);
}

for (my $i = 0; $i <= $#numbers; $i++) {
    push(@add, $numbers[$i]);

    for (my $j = $i + 1; $j <= $#numbers; $j++) {
        push(@subtract, lcm($numbers[$i], $numbers[$j]));
    }
}

foreach my $n (@add) {
    $sum += sum(int($limit / $n), $n, $n);
}

foreach my $n (@subtract) {
    $sum -= sum(int($limit / $n), $n, $n);
}

print $sum . "\n";

sub gcd {
    my ($a, $b) = @_;

    if ($a == 0 || $b == 0) {
        return 0;
    }

    while ($b != 0) {
        ($a, $b) = ($b, $a % $b);
    }

    return $a;
}

sub lcm {
    my ($a, $b) = @_;

    if ($a == 0 || $b == 0) {
        return 0;
    }

    my $gcd = gcd($a, $b);

    return (abs($a) / $gcd) * abs($b);
}

sub sum {
    my ($n, $i, $d) = @_;

    return $n * (2 * $i + ($n - 1) * $d) / 2;
}
