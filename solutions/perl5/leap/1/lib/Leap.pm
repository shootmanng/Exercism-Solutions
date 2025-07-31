# Declare package 'Leap'
package Leap;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_leap_year>;

sub is_leap_year ($year) {
    if ($year % 4 ==0 && $year % 100 == 0) {return $year % 400 == 0}
    else {return $year % 4 == 0}
}

1;
