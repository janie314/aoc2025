
use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';
use List::Util qw(sum);
use List::MoreUtils;
use Data::Dumper;

sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s; }

my @arr;

while (<>) {
    chomp;
    last if /[\+\*]/;
    push @arr, [ split '' ];
}

<>;
chomp;
s/\s+/ /;
my @ops = split ' ';

print Dumper(\@arr);

my @arr2;

foreach my $j (0 .. scalar @{ $arr[0] }) {
    push @arr2, [ map { $arr[$_]->[$j] } (0 .. scalar @arr - 1) ];
}

@arr2 = map { int(trim(join '', @{$_})) || -1 } (@arr2);

my $i        = 0;
my $total    = 0;
my $subtotal = 0;
foreach my $x (@arr2) {
    if ($x == -1) {
        $total += $subtotal;
        $i++;
        $subtotal = 0;
    } elsif ($subtotal == 0) {
        $subtotal = $x;
    } else {
        $subtotal += $x if $ops[$i] eq '+';
        $subtotal *= $x if $ops[$i] eq '*';
    }
}

print "$total\n";
