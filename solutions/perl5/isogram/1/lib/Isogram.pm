package Isogram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_isogram>;

sub is_isogram ($phrase) {
    my @string = split //, $phrase;

    foreach (@string) {
        my $val = $_;
        if ($val =~ /[a-zA-Z]/ && (scalar(grep {$_ =~ /$val/i} @string) > 1)) {
            return 0;
        }
    }
    return 1;
}

1;
