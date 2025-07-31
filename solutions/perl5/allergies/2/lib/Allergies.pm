package Allergies;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

my %allergies = (
    cats => 128,
    pollen => 64,
    chocolate => 32,
    tomatoes => 16,
    strawberries => 8,
    shellfish => 4,
    peanuts => 2,
    eggs => 1,
);

        
sub allergic_to ( $item, $score ) {
    # This does what I was trying to do in iteration 1 with one line,
    # the (&) operator compares the binary of the two arguments, in this case each
    # item has a unique bit, so if the score is divisible by the item the bit will be on
    # and all else off, so itll be true
    return %allergies{$item} & $score;
}

sub list_allergies ($score) {
    # grep goes through all the keys in allergies and checks for entries where
    # the previous sub is true
    my @result = grep {&allergic_to($_,$score)} keys %allergies;
    return \@result;
}

1;
