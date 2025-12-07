package aoc2025;

use strict;
use warnings;

our $VERSION = 1.0;

my $i   = 50;
my $res = 0;

while (<>) {
    my ($lr, $num) = m/([LR])(\d+)/s;
    $i = ($i + ($lr eq 'L' ? -1 : 1) * int($num)) % 100;
    $res++ if $i == 0;
}

print "$res\n";

1;
