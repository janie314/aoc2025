use strict;
use warnings;

sub log10 {
    my $n = shift;
    return log($n) / log(10);
}

sub leftmost {
    my $n = shift;
    return int($n / 10**int(log10($n)));
}

print leftmost 23423423;
print "\n";
print leftmost 938;
