use strict;
use warnings;

my $i   = 50;
my $res = 0;

while (<>) {
    my ( $lr, $num ) = m/([LR])([0-9]+)/;
    $i = ( $i + ( $lr eq 'L' ? -1 : 1 ) * int($num) ) % 100;
    $res++ if $i == 0;
}

print "$res\n";
