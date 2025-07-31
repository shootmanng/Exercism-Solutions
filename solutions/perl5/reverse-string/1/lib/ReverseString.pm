package ReverseString;
use Unicode::GCString;
use utf8;
use Unicode::Normalize;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<str_reverse>;

sub str_reverse ($text) {
    my $str = '';
    $str = join("", reverse $text =~ /\X/g);
    return $str;
}

1;
