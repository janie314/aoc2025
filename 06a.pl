package AOC2025;

use strict;
use warnings;

our $VERSION = 1.0;

no warnings 'experimental::re_strict';
use re 'strict';
use List::Util qw(sum);
use List::MoreUtils;
use Data::Dumper;

my @arr;

while (<>) {
    chomp;
    last if /[\*\+]/s;
    s/^\s+//gs;
    s/\s+$//gs;
    s/\s+/ /gs;
    push @arr, [ map {int} (split / /s) ];
}

<>;
s/^\s+//gs;
s/\s+$//gs;
s/\s+/ /gs;

my @ops = split / /s;

my $result = [];

foreach my $row (@arr) {
    if (not scalar @{$result}) {
        $result = $row;
    } else {
        foreach my $i (0 .. scalar @{$row} - 1) {
            $result->[$i] *= $row->[$i] if $ops[$i] eq '*';
            $result->[$i] += $row->[$i] if $ops[$i] eq '+';
        }
    }
}

print sum(@{$result}) . "\n";

1;
