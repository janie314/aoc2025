package AOC2025;

use strict;
use warnings;

our $VERSION = 1.0;

no warnings 'experimental::re_strict';
use re 'strict';
use List::Util      qw( min max uniq reduce );
use List::MoreUtils qw( first_index );
use Data::Dumper;

sub d {
    my ($v, $w) = @_;
    return ($v->[0] - $w->[0])**2 + ($v->[1] - $w->[1])**2 + ($v->[2] - $w->[2])**2;
}

# pull the input
my @arr;
while (<>) {
    chomp;
    push @arr, [ map {int} (split /,/s) ];
}

# identify circuits by least index of member
my %index;

foreach my $i (0 .. scalar @arr - 1) {
    foreach my $j (0 .. scalar @arr - 1) {
        next if $i == $j;
        $index{ d($arr[$i], $arr[$j]) } = [ $i, $j ];
    }
}

my @circuits;
my @biglist;
my @keys  = keys %index;
my $count = 0;
foreach my $i (sort { int($a) <=> int($b) } @keys) {
    last if $count >= 10;
    my ($x, $y) = @{ $index{$i} };
    my $added = 0;
    foreach my $circuit (@circuits) {
        last if $added;
        if ((first_index { $_ == $x or $_ == $y } @{$circuit}) != -1) {
            push @{$circuit}, ($x, $y);
            my $before = scalar @biglist;
            push @biglist, ($x, $y);
            @{$circuit} = uniq @{$circuit};
            @biglist = uniq @biglist;
            $count++ if scalar @biglist > $before;
            $added = 1;
        }
    }
    unless ($added) {
        push @circuits, [ $x, $y ];
        push @biglist, ($x, $y);
        @biglist = uniq @biglist;
        $count++;
    }
}

printf "%d\n", reduce { $a * $b } (map { scalar @{$_} } (reverse sort { scalar @{$a} <=> scalar @{$b} } @circuits)[ 0 .. 2 ]);

1;
