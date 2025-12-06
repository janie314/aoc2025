
use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';
use List::Util qw(min max);
use List::MoreUtils;

my $code = 'sub f { my ($i) = @_; ';
my $min  = 0;
my $max  = 0;

while (<>) {
    chomp;
    last if $_ eq '';
    my ($x, $y) = split '-';
    $min = min($min, min($x, $y));
    $max = max($max, max($x, $y));
    $code .= "return 1 if $x <= \$i and \$i <= $y; ";
}
$code .= "return 0; }";

eval $code;

my $count1 = 0;

while (<>) {
    $count1++ if f(int($_));
}

print "$count1\n";
