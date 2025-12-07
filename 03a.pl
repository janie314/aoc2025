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
    my @nums   = split //s;
    my $digit1 = List::Util::max map {int} (@nums[ 0 .. scalar @nums - 2 ]);
    my $index  = List::MoreUtils::first_index { int eq $digit1 } (@nums);
    my $digit2 = List::Util::max map {int} (@nums[ $index + 1 .. scalar @nums - 1 ]);
    $total += $digit1 * 10 + $digit2;
}

print "$total\n";

1;
