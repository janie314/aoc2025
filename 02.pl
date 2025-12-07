package AOC2025;

use strict;
use warnings;

our $VERSION = 1.0;

no warnings 'experimental::re_strict';
use re 'strict';

my $sum1 = 0;
my $sum2 = 0;

while (<>) {
    foreach my $range (split /,/s) {
        my ($start, $end) = split /-/s, $range;
        next unless $start and $end;
        for my $i (int($start) .. int($end)) {
            $sum1 += $i if $i =~ /^(\d+)\g{-1}$/s;
            $sum2 += $i if $i =~ /^(\d+)\g{-1}+$/s;
        }
    }
}

print "$sum1\n$sum2\n";

1;
