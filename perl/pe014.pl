#!/usr/bin/perl
# http://projecteuler.net/problem=14
# Finds the starting number below 1 million that produces the longest chain
# following the Collatz sequence.

use strict;
use warnings;

my $limit = 1000000;
my @collatz;
my $max_steps = my $max_n = -1;

for (my $n = 1; $n < $limit; $n++) {
    my $steps = 1;

    for (my $i = $n; $i > 1; ) {
        # $i & 1 is equivalent to $i % 2
        if ($i & 1 == 1) {
            $i = (3 * $i) + 1;
            $steps++;
        }
        else {
            # $i >> 1 is equivalent to $i / 2
            $i >>= 1;

            if (defined($collatz[$i])) {
                $steps += $collatz[$i];
                last;
            }

            $steps++;
        }
    }

    $collatz[$n] = $steps;

    if ($steps > $max_steps) {
        $max_steps = $steps;
        $max_n = $n;
    }
}

print $max_n . "\n";
