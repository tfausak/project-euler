#!/usr/bin/perl

# Project Euler problem 8
# by Taylor Fausak

# Finds the greatest product of five consecutive digits in a number. Simply
# makes the number a string and moves through it.

use strict;
use warnings;

my $length = 5;
my $max = -1;
my $n = '';

open(INPUT, '<', $ARGV[0]) or die $!;

while (my $line = <INPUT>) {
    $line =~ s/^\s*(\d+)\s*$/$1/; # trim whitespace
    $n .= $line;
}

close(INPUT) or die $!;

for (my $offset = 0; $offset < length($n) - $length; $offset++) {
    my $product = 1;
    
    foreach my $digit (split('', substr($n, $offset, $length))) {
        $product *= $digit;
    }
    
    if ($product > $max) {
        $max = $product;
    }
}

print $max . "\n";
