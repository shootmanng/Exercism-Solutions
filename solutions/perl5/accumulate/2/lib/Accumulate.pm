package Accumulate;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate {
    my ( $list, $func ) = @_;
    # dont need my $x just use $_
    foreach (@$list) {
        $_ = &$func($_);    
    }
    return $list;
}

1;
