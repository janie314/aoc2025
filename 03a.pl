package aoc2025;

use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';
use List::Util;
use List::MoreUtils;

my $total = 0;

while (<>) {
    chomp;
    my @nums   = split '';
    my $digit1 = List::Util::max map { int($_) } (@nums[ 0 .. scalar @nums - 2 ]);
    my $index  = List::MoreUtils::first_index { int($_) eq $digit1 } (@nums);
    my $digit2 = List::Util::max map { int($_) } (@nums[ $index + 1 .. scalar @nums - 1 ]);
    $total += $digit1 * 10 + $digit2;
}

print "$total\n";

1;
