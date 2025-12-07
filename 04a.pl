package AOC2025;

use strict;
use warnings;

our $VERSION = 1.0;

no warnings 'experimental::re_strict';
use re 'strict';
use List::Util;
use List::MoreUtils;

my @grid;

while (<>) {
    chomp;
    push @grid, [ split //s ];
}

my $n     = scalar @grid;
my $total = 0;

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
        $total++ if $c < 4;
    }
}

print "$total\n";

1;
