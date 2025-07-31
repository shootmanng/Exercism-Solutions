package AllYourBase;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
    "input base must be >= 2",
    "output base must be >= 2",
    "all digits must satisfy 0 <= d < input base",
);

sub rebase {
    my ( $digits, $input_base, $output_base ) = @_;
    my @result;
    my $sum = 0;
    
    # error checks
    if ($input_base < 2) {
        die $errors[0];
    }
    if ($output_base < 2) {
        die $errors[1];
    }
    foreach (@$digits) {
        if ($_ < 0 || $_ >= $input_base) {
            die $errors[2];
        }
        # convert to base 10
        $sum = ($sum + $_) * $input_base;
        #print $sum;
    }
    
    $sum /= $input_base;
    my $remainder = $sum;
    
    # rule out stupid cases
    
    if ($sum == 0 || !defined($sum)) {return [0]}
    
    # convert to output base
    
    while ($remainder >= 1) {

        unshift(@result, $sum % $output_base);
        $sum = int($sum/$output_base);
        $remainder = int($remainder / $output_base);
    
    }
    return \@result;
}

1;
