package Scrabble;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<scrabble_score>;

my %score = (
    A => 1,
    E => 1,
    I => 1,
    O => 1,
    U => 1,
    L => 1,
    N => 1,
    R => 1,
    S => 1,
    T => 1,
    D => 2,
    G => 2,
    B => 3,
    C => 3,
    M => 3,
    P => 3,
    F => 4,
    H => 4,
    V => 4,
    W => 4,
    Y => 4,
    K => 5,
    J => 8,
    X => 8,
    Q => 10,
    Z => 10,
);

sub scrabble_score ($word) {
    my @word = split //, $word;
    my $sum = 0;
    $sum += $score{uc($_)} for @word;
    return $sum;
}

1;
