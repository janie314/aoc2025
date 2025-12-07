
use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';
use Data::Dumper;
use List::Util      qw( uniq sum );
use List::MoreUtils qw( first_index );

# pull the input
my @arr;
while (<>) {
    chomp;
    push @arr, [ split '' ];
}

my $split = 0;
my %beams = ((first_index { $_ eq 'S' } (@{ $arr[0] })) => 1);
my @paths;

foreach my $row (2 .. scalar @arr - 1) {
    my %newbeams;
    while (my ($index, $paths) = each %beams) {
        if ($arr[$row]->[$index] eq '^') {
            $newbeams{ $index - 1 } = ($newbeams{ $index - 1 } || 0) + $paths;
            $newbeams{ $index + 1 } = ($newbeams{ $index + 1 } || 0) + $paths;
        } else {
            $newbeams{$index} = ($newbeams{$index} || 0) + $paths;
        }
    }
    %beams = %newbeams;
}

print sum(values %beams) . "\n";
