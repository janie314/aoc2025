package AOC2025;

use strict;
use warnings;

our $VERSION = 1.0;

no warnings 'experimental::re_strict';
use re 'strict';
use List::Util;
use List::MoreUtils;

my $total = 0;

while (<>) {
    chomp;
    my @nums  = map {int} (split //s);
    my $start = 0;
    my $stop  = scalar @nums - 12;
    foreach my $i (0 .. 11) {
        my $digit = List::Util::max(@nums[ $start .. $stop ]);
        my $index = $start + List::MoreUtils::first_index { int eq $digit } (@nums[ $start .. $stop ]);
        $start = $index + 1;
        $stop++;
        $total += $digit * 10**(11 - $i);
    }
}

print "$total\n";

1;
