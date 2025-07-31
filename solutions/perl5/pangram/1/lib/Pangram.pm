package Pangram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_pangram>;

sub is_pangram ($text) {

    my @letters =  qw<a b c d e f g h i j k l m n o p q r s t u v w x y z>;
    my $i = 0;

    foreach (@letters) {

        if ($text =~ /$_/i) {

            $i++;
        }
    }

    if ($i < 26) {

        return 0;
    }
    return 1;
}

1;
