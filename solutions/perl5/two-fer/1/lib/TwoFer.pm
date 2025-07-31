package TwoFer;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

sub two_fer ( $name = undef ) {
    my $receipt = defined($name) ? $name : "you";
    return "One for $receipt, one for me.";
}

1;
