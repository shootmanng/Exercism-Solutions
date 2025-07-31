package Grains;

use v5.40;
use Math::BigInt;

use Exporter qw<import>;
our @EXPORT_OK = qw<grains_on_square total_grains>;

sub grains_on_square ($square) {
    if ($square <= 0 || $square > 64) {die "square must be between 1 and 64"}
    return sprintf "%.0f", 2 ** ($square - 1);
}

sub total_grains () {
    return Math::BigInt->new(2)->bpow(64) - 1;;
}

1;
