use strict;
use warnings;
use re 'strict';

my $sum  = 0;
my $sum2 = 0;

while (<>) {
    foreach my $range ( split ',' ) {
        my ( $start, $end ) = split '-', $range;
        next unless $start and $end;
        for my $i ( int($start) .. int($end) ) {
            $sum  += $i if $i =~ /^([0-9]+)\g{-1}$/;
            $sum2 += $i if $i =~ /^([0-9]+)\g{-1}+$/;
        }
    }
}

print "$sum\t$sum2\n";
