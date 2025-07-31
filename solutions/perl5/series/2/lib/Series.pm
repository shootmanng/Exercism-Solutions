package Series;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<slices>;

sub slices ( $series, $slice_length ) {

    # silly stuff
    die "series cannot be empty" if length($series) == 0;
    die "slice length cannot be greater than series length" if length($series) < $slice_length;
    die "slice length cannot be zero" if $slice_length == 0;
    die "slice length cannot be negative" if $slice_length < 0;

    #start
    my @result = map {substr($series, $_, $slice_length)} 0 .. length($series) - $slice_length;
    return \@result;
}

1;
