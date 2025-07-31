package Hamming;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hamming_distance>;

sub hamming_distance ( $strand1, $strand2 ) {

    if (length($strand1) != length($strand2)) {die "strands must be of equal length"}
    if (length($strand1) == 0) {return 0}

    my $hamming = 0;
    my @arr1 = split //, $strand1;
    my @arr2 = split //, $strand2;
    my $i = 0;
    
    foreach (@arr1) {
        if ($_ ne $arr2[$i]) {$hamming += 1}
        $i++;
    }
    return $hamming;
}

1;
