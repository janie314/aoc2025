use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';

my $sum1 = 0;
my $sum2 = 0;

while (<>) {
    foreach my $range (split ',') {
        my ($start, $end) = split '-', $range;
        next unless $start and $end;
        for my $i (int($start) .. int($end)) {
            $sum1 += $i if $i =~ /^([0-9]+)\g{-1}$/;
            $sum2 += $i if $i =~ /^([0-9]+)\g{-1}+$/;
        }
    }
}

print "$sum1\t$sum2\n";
