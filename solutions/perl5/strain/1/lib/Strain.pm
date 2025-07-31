package Strain;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<keep discard>;

sub keep ( $input, $function ) {
    my $result = [];
    foreach(@$input) {
        if ($function -> ($_) != 0) {
            push @$result, $_;
        }
    }
    return $result;
}

sub discard ( $input, $function ) {
    my $result = [];
    foreach(@$input) {
        if ($function -> ($_) == 0) {
            push @$result, $_;
        }
    }
    return $result;
}

1;
