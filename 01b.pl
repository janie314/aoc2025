package aoc2025;
use strict;
use warnings;

my $i    = 50;
my $next = 0;
my $res  = 0;

while (<>) {
    my ($lr, $num) = m/([LR])([0-9]+)/;
    $num = int($num);
    my $sgn = $lr eq 'L' ? -1 : 1;
    if ($i != 0 and $sgn == -1 and $num >= $i) {
        $res += int(($num - $i) / 100) + 1;
    } elsif ($i != 0 and $sgn == 1 and $num >= 100 - $i) {
        $res += int(($num + $i) / 100);
    } elsif ($i == 0) {
        $res += int($num / 100);
    }
    $i = ($i + $sgn * $num) % 100;
}

print "$res\n";

1;
