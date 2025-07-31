package PrimeFactors;
use Data::Dumper;
use v5.40;
use feature qw/say/;

use Exporter qw<import>;
our @EXPORT_OK = qw<factors>;

sub factors {

    my ($number) = @_;
    my @result = ();
    my $i = 2;
    
    while ($i < ($number + 1)) {

        if ($number % $i == 0) {
            
            push @result, $i;
            $number /= $i;
        } else {$i++}
        
    }
    return \@result;
}

1;
