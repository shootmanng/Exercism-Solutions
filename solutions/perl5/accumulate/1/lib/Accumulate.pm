package Accumulate;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate {
    my ( $list, $func ) = @_;
    foreach my $x (@$list) {
        $x = &$func($x);    
    }
    return $list;
}

1;
