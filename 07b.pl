
use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';
use Data::Dumper;
use List::Util      qw( uniq );
use List::MoreUtils qw( first_index );

# pull the input
my @arr;
while (<>) {
    chomp;
    push @arr, [ split '' ];
}

my $start = first_index { $_ eq 'S' } (@{ $arr[0] });

sub recurse {
    my ($row, $i) = @_;
    my $sum = 0;
    return 0                     if $i < 0 or $i > scalar @{ $arr[0] } - 1;
    return 1                     if $row == scalar @arr;
    return recurse($row + 1, $i) if $arr[$row]->[$i] eq '.';
    return recurse($row + 1, $i - 1) + recurse($row + 1, $i + 1);
}

print recurse(2, $start) . "\n";
