package LargestSeriesProduct;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<largest_product>;

sub _prod ($arr, $start, $span) {
    
    my @copy = @$arr;
    my @chunk = splice @copy, $start;
    my $i = 0;
    my $result = 1;
    
    while ($i < $span) {

        $result *= $chunk[$i];  
        $i++;
    }

    return $result;
}

sub largest_product ( $digits, $span ) {
    
    my $i = 0;
    my $result = 0;
    my @array = split //, $digits;

    if ($digits =~ /[^0-9]/) {die "digits input must only contain digits"}
    if ($span < 0) {die "span must not be negative"}
    if ($span > scalar(@array)) {die "span must be smaller than string length"}

    if (length($digits) == 2) {return $array[0] * $array[1]}
    
    while ($i + $span - 1 < scalar(@array)) {

        my $prod = &_prod(\@array, $i, $span);
        
        if ($prod > $result) {$result = $prod}

        $i++;
    }

    return $result;
}
1;
