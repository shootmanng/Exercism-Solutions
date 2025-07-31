package SumOfMultiples;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<sum_of_multiples>;
sub summer {
    my ($list) = @_;
    my $sum = 0;
    
    foreach(@$list) {
        $sum += $_;    
    }
    return $sum;
}
sub sum_of_multiples ( $factors, $limit ) {

    # stupid cases
    return 0 if scalar(@$factors) == 0 || @$factors[0] == 0;
    my @mults = ();
        
    foreach(@$factors) {

        my $i = 0;
        my $factor = undef;
        my $factor = $_ unless $_ == 0;
        
        while (defined($factor) && $i * $factor < $limit) {

            push @mults, $i * $factor unless grep {$i * $factor == $_} @mults;
            $i++;
        }
    }
    
    return &summer(\@mults);
    
}

1;
