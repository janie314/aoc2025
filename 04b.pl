package aoc2025;

use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';
use List::Util;
use List::MoreUtils;

my @grid;

while (<>) {
    chomp;
    push @grid, [ split '' ];
}

my $n       = scalar @grid;
my $total   = 0;
my $removed = 1;

while ($removed) {
    $removed = 0;
    foreach my $i (0 .. $n - 1) {
        foreach my $j (0 .. $n - 1) {
            my $c = 0;
            next unless $grid[$i]->[$j] eq '@';
            foreach my $x (-1 .. 1) {
                foreach my $y (-1 .. 1) {
                    next if $i + $x < 0 or $i + $x > $n - 1 or $j + $y < 0 or $j + $y > $n - 1;
                    next if $x == 0 and $y == 0;
                    $c++ if $grid[ $i + $x ]->[ $j + $y ] eq '@';
                }
            }
            if ($c < 4) {
                $total++;
                $removed = 1;
                $grid[$i]->[$j] = 'x';
            }
        }
    }
}

print "$total\n";

1;
