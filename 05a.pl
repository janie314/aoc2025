package AOC2025;

use strict;
use warnings;

our $VERSION = 1.0;

no warnings 'experimental::re_strict';
use re 'strict';
use List::Util qw(min max);
use List::MoreUtils;
use Carp;

my $code = 'sub f { my ($i) = @_; ';
my $min  = 0;
my $max  = 0;

while (<>) {
    chomp;
    last unless length;
    my ($x, $y) = split /-/s;
    $min = min($min, min($x, $y));
    $max = max($max, max($x, $y));
    $code .= "return 1 if $x <= \$i and \$i <= $y; ";
}
$code .= 'return 0; }';

## no critic qw(BuiltinFunctions::ProhibitStringyEval, ErrorHandling::RequireCheckingReturnValueOfEval)
eval $code;

my $count1 = 0;

while (<>) {
    $count1++ if f(int);
}

print "$count1\n";

1;
