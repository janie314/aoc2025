
use strict;
use warnings;
no warnings 'experimental::re_strict';
use re 'strict';
use Data::Dumper;

sub trim {
    my ($s) = @_;
    $s =~ s/^\s+|\s+$//g;
    return $s;
}

sub condense {
    my ($v) = @_;
    my $str = join '', @{$v};
    return -1 if $str =~ /^\s*$/;
    return int($str);
}

# pull the input
my @arr;
while (<>) {
    chomp;
    last if /[\+\*]/;
    push @arr, [ split '' ];
}

# get the list of +/* operations
<>;
chomp;
s/\s+/ /;
my @ops = split ' ';

# transpose
my @arr2;
foreach my $j (0 .. scalar @{ $arr[0] } - 1) {
    push @arr2, condense([ map { $arr[$_]->[$j] } (0 .. scalar @arr - 1) ]);
}

# do the math
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
