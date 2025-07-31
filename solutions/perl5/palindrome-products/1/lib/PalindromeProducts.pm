package PalindromeProducts;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<smallest_palindrome largest_palindrome>;

sub smallest_palindrome ( $min, $max ) {

    if ($max < $min) {die "min must be <= max."}
    my $sign = 1;
    if ($min < 0) {$sign = -1}
    my $value;
    if ($max > 0) {$value = $max ** 2} else {$value = -($max ** 2)}
    my $factors = [];

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

    foreach (@$factors) {
    
    @{$_}=sort @{$_};
}
    
    my %result = (
        factors => $factors,
        value => $value,
    );
    print Dumper(\%result);
    return \%result;
}

sub largest_palindrome ( $min, $max ) {
    return &smallest_palindrome ( -$max, -$min);
}

1;
