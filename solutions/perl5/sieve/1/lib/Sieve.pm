package Sieve;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<find_primes>;

sub _first_index {
    my ($array, $val) = @_;
    my $i = 0;
    foreach (@$array) {
        if ($_ eq $val) {return $i}
        $i++;
    }

    return -1;
}

sub find_primes ($limit) {
    my @list = 2..$limit;

    foreach my $i (@list) {
        
        foreach (2..int($limit/$i)) {
    
            my $check = &_first_index(\@list, $i * $_);
            if ($check != -1) {splice(@list, $check, 1)}     
        }
    }
    
    return \@list;
}

1;
