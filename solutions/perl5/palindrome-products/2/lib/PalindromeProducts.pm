package PalindromeProducts;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<smallest_palindrome largest_palindrome>;

sub smallest_palindrome ( $min, $max ) {
    my $sign = 1;
    my $value;
    my $factors = [];
    
    if ($max < $min) {die "min must be <= max."}
    if ($min < 0) {$sign = -1}
    if ($max > 0) {$value = $max ** 2} else {$value = -($max ** 2)}

    for my $i ($min..$max) {
    
        for my $j ($i..$max) {
    
                my $test = $i * $j;
                
                if ("$test" eq reverse "$test") { 
                    if ($test * $sign < $value) {
                        $value = $test * $sign;
                        $factors = [[$i * $sign, $j * $sign]];
                    } elsif ($test * $sign == $value) {
                        push @$factors, [$i * $sign, $j * $sign];
                    }
                }
        }
    }

    if ($value == $sign * $max ** 2) {$value = undef}
    if ($value < 0) {$value = $sign * $value}

    # sort the factors because it marks 9,1 incorrect even though order is irrelevant
    # for factors
    
    foreach (@$factors) {
    
        @{$_}=sort @{$_};
    }
    
    my %result = (
        factors => $factors,
        value => $value,
    );
    
    return \%result;
}

sub largest_palindrome ( $min, $max ) {
    return &smallest_palindrome ( -$max, -$min);
}

1;
