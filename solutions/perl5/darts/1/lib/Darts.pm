package Darts;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

sub score_dart ( $x, $y ) {
    if (($x ** 2 + $y ** 2) > 100) {return 0}
    if (25 < ($x ** 2 + $y ** 2) <= 100) {return 1}
    if (1 < ($x ** 2 + $y ** 2) <= 25) {return 5}
    if (0 <= ($x ** 2 + $y ** 2) <= 1) {return 10}
}

1;
