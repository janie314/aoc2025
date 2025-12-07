
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

my $split = 0;
my @beams = (first_index { $_ eq 'S' } (@{ $arr[0] }));

foreach my $i (2 .. scalar @arr - 1) {
    my @newbeams;
    foreach my $beam (@beams) {
        if ($arr[$i]->[$beam] eq '^') {
            push @newbeams, $beam - 1;
            push @newbeams, $beam + 1;
            $split++;
        } else {
            push @newbeams, $beam;
        }
    }
    @beams = uniq @newbeams;
}

print "$split\n";
