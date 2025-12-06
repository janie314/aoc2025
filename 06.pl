
use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';
use List::Util qw(sum);
use List::MoreUtils;
use Data::Dumper;

my @arr;

while (<>) {
    chomp;
    last if /[\*\+]/;
    $_ =~ s/^\s+//g;
    $_ =~ s/\s+$//g;
    $_ =~ s/\s+/ /g;
    push @arr, [ map { int($_) } (split ' ') ];
}

<>;
$_ =~ s/^\s+//g;
$_ =~ s/\s+$//g;
$_ =~ s/\s+/ /g;

my @ops = split ' ';

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
