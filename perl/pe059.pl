#!/usr/bin/env perl
# http://projecteuler.net/problem=59

use strict;
use warnings;

my $sum = 0;

open(INPUT, '<', $ARGV[0]) or die($!);

while (my $line = <INPUT>) {
    my @secret = split(',', $line);

    foreach my $i (0 .. $#secret) {
        my $cipher = 0;

        if ($i % 3 == 0) {
            $cipher = 103; # g
        }
        elsif ($i % 3 == 1) {
            $cipher = 111; # o
        }
        else {
            $cipher = 100; # d
        }

        $sum += $secret[$i] ^ $cipher;
    }
}

print $sum . "\n";

close(INPUT) or die($!);

exit(0);

my @secret;
my @az = 97 .. 122;

open(INPUT, '<', $ARGV[0]) or die($!);

while (my $line = <INPUT>) {
    push(@secret, split(',', $line));
}

close(INPUT) or die($!);

foreach my $a (@az) {
    foreach my $b (@az) {
        foreach my $c (@az) {
            my $text = '';
            my $sum = 0;

            foreach my $i (0 .. $#secret) {
                if ($i % 3 == 0) {
                    $text .= sprintf("%c", $secret[$i] ^ $a);
                }
                elsif ($i % 3 == 1) {
                    $text .= sprintf("%c", $secret[$i] ^ $b);
                }
                else {
                    $text .= sprintf("%c", $secret[$i] ^ $c);
                }
            }

            if (!($text =~ /\bthe\b/i)) {
                next;
            }

            printf("%c%c%c: %s\n\n", $a, $b, $c, $text);
        }
    }
}
