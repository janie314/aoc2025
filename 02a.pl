use strict;
use warnings;

my $sum = 0;

while(<>) {
    foreach my $range (split ',') {
        my ($start, $end) = split '-', $range;
        next unless $start and $end;
        for my $i (int($start)..int($end)) {
            $sum += $i if "$i" =~ /([0-9]+)\g{-1}/;
            print "$i\t" if "$i" =~ /([0-9]+)\g{-1}/;
        }
    }
}

print $sum;