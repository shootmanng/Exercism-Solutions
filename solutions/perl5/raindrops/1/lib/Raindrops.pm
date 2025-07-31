package Raindrops;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<raindrop>;

sub raindrop ($number) {

    my $result = '';
    if ($number % 3 == 0) {$result .= "Pling"}
    if ($number % 5 == 0) {$result .= "Plang"}
    if ($number % 7 == 0) {$result .= "Plong"}
    if (($number % 3 != 0 && $number % 5 != 0  && $number % 7 != 0) != 0) {$result .= "$number"}

    return $result;
}

1;
