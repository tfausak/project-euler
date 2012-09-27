#!/usr/bin/perl
# http://projecteuler.net/problem=79
# Assumes the passcode has no repeating digits.

use strict;
use warnings;

my %nodes;
my @s;
my $result = '';

open(INPUT, '<', $ARGV[0]) or die($!);

while (my $line = <INPUT>) {
    $line =~ s/^\s*(\d+)\s*$/$1/; # trim whitespace

    my @line = split('', $line);

    foreach my $i (0 .. $#line - 1) {
        my $a = $line[$i];

        foreach my $j (1 .. $#line - $i) {
            my $b = $line[$i + $j];

            if (defined($nodes{$a}) && index($nodes{$a}, $b) != -1) {
                next;
            }

            $nodes{$a} .= $b;
        }
    }
}

close(INPUT) or die $!;

foreach my $node (keys(%nodes)) {
    if (!has_incoming_edge($node, %nodes)) {
        push(@s, $node);
    }
}

while (@s) {
    my $node = pop(@s);
    my @edges;

    if (defined($nodes{$node})) {
        @edges = split('', $nodes{$node});
    }

    $result .= $node;

    foreach my $edge (@edges) {
        $nodes{$node} = substr($nodes{$node}, 1);

        if (!has_incoming_edge($edge, %nodes)) {
            push(@s, $edge);
        }
    }
}

print $result . "\n";

sub has_incoming_edge {
    my ($node, %nodes) = @_;

    foreach my $k (keys(%nodes)) {
        my @edges = split('', $nodes{$k});

        foreach my $edge (@edges) {
            if ($node == $edge) {
                return 1;
            }
        }
    }

    return undef;
}
