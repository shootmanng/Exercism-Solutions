package PythagoreanTriplet;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<triplets_with_sum>;

sub triplets_with_sum {

    my ($sum) = @_;
    my $second;
    my $third;
    my @result = ();
    
    foreach my $first (1..$sum/3) {
    
        $second = $first + 1; 
        $third = $sum - $first - $second;
        
        while (($second < $sum/2) && ($second < $third)) {

            if (2*$first*$second-2*$first*$sum-2*$second*$sum+$sum**2 == 0){

                push @result, [$first, $second, $third];
            }

            $second++;
            $third--;
        }
        $first++;
    }
    
    return \@result;
}

1;
