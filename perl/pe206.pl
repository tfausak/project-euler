#!/usr/bin/perl

# Project Euler problem 206
# by Taylor Fausak

use strict;
use warnings;

my $lb = 1020304050607080900;
my $ub = 1929394959697989990;

$lb = int(sqrt($lb));
$ub = int(sqrt($ub));

my $n = $lb;

while ($n % 10 != 0) {
    $n++; # n must end in 0
}

while ($n % 100 != 30 && $n % 100 != 70) {
    $n++; # n must end in 30 or 70
}

while ($n <= $ub) {
    my $n2 = $n * $n;

    # regex is equivalent to /1.2.3.4.5.6.7.8.9.0/, but marginally faster
    if ($n2 =~ /^1\d2\d3\d4\d5\d6\d7\d8\d900$/) {
        last;
    }

    if ($n % 100 == 30) {
        $n += 40;
    }
    else {
        $n += 60;
    }
}

print $n . "\n";
