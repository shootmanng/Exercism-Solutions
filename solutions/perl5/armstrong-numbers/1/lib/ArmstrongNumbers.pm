package ArmstrongNumbers;
use bignum;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_armstrong_number>;

sub is_armstrong_number ($number) {
    $number = Math::BigInt->new($number);
    my $n = Math::BigInt->new(length($number));
    my $sum = Math::BigInt->new(0);
    $sum += $_ ** $n for split //, $number;
    say $sum;
    return $sum == $number;
}

1;
