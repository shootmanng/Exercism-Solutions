package SecretHandshake;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<handshake>;


sub _to_bin ($number) {
    my @binary = ();

    while ($number > 0) {
        
        unshift @binary, $number % 2;
        $number = int($number/2);
    }

    while (scalar(@binary) < 5) {
    unshift @binary, 0;
    }
    
    return \@binary;
}
sub handshake ($number) {

    if ($number < 0 || $number > 31) {
        die "Number must be between 0 and 31.";
    }
    if ($number == 0) {
        return [];
    }

    $number = &_to_bin($number);
    my $result = [];
    
    if (@$number[4] == 1) {
        push @$result, "wink";
    }

    if (@$number[3] == 1) {
        push @$result, "double blink";
    }

    if (@$number[2] == 1) {
        push @$result, "close your eyes";
    }

    if (@$number[1] == 1) {
        push @$result, "jump";
    }

    if (@$number[0] == 1) {
        @$result = reverse @$result;
    }
    
    return $result;
}

1;
