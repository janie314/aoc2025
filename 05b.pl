package aoc2025;

use strict;
use warnings;

our $VERSION = 1.0;

no warnings 'experimental::re_strict';
use re 'strict';
use List::Util qw(min max);
use List::MoreUtils;
use Data::Dumper;

my @ranges;

while (<>) {
    chomp;
    last unless length;
    my ($x, $y) = split /-/s;
    push @ranges, [ int($x), int($y), 1 ];
}

my $length = 0;

my $prev_start = 0;
my $prev_end   = 0;
my $bad        = 1;

while ($bad) {
    $bad    = 0;
    $length = 0;
    @ranges = grep { $_->[2] } (sort { $a->[0] <=> $b->[0] } @ranges);
    foreach my $range (@ranges) {
        if ($prev_start <= $range->[0] and $range->[1] <= $prev_end) {
            $range->[2] = 0;
            $bad = 1;
        } elsif ($range->[0] <= $prev_end and $prev_end <= $range->[1]) {
            $range->[0] = $prev_end + 1;
            $bad = 1;
        }
        $length += $range->[1] - $range->[0] + 1;
        $prev_start = $range->[0];
        $prev_end   = $range->[1];
    }
}

print "$length\n";

1;
