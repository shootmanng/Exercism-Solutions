package Gigasecond;

use Time::Piece;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<add_gigasecond>;

sub add_gigasecond ($time) {
    my $t = Time::Piece -> strptime($time, '%Y-%m-%dT%H:%M:%S');
    return ($t + (1000 * 1000000)) -> strftime('%Y-%m-%dT%H:%M:%S');
}

1;
