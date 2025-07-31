package AffineCipher;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode decode>;

my %dict = (
    'a' => 0,
    'b' => 1,
    'c' => 2,
    'd' => 3,
    'e' => 4,
    'f' => 5,
    'g' => 6,
    'h' => 7,
    'i' => 8,
    'j' => 9,
    'k' => 10,
    'l' => 11,
    'm' => 12,
    'n' => 13,
    'o' => 14,
    'p' => 15,
    'q' => 16,
    'r' => 17,
    's' => 18,
    't' => 19,
    'u' => 20,
    'v' => 21,
    'w' => 22,
    'x' => 23,
    'y' => 24,
    'z' => 25,
);

my %inv = reverse %dict;

my $modulus = 26;

sub format_encrypt {

    my ($input) = @_;
    my @input = @$input;
    my $i = 0;
    my $result = '';
    
    foreach (@input) {

        # Since 0 % 5 = 0 and I dont want && $i != 0 I just look at 
        # $i + 1 % 6 == 0 and bump $i up twice since we're adding 2
        # characters in this case
        if (($i + 1) % 6 == 0) {

            $result = $result." ".$_;
            $i++;
        } else {

            $result = $result.$_;
        }

        $i++;
    }

    return $result;
}

sub coprime {
    my ( $a, $b ) = @_;

    while ($b != 0) {
        ($a, $b) = ($b, $a % $b);
    }

    return $a;
}

sub minv {
    
    my ($a) =  @_;
    my $c;

    foreach (1..25) {
        if (($_ * $a) % 26 == 1) {
            $c = $_;
        }
    }
    return $c;
}

sub encode {

    my ( $phrase, $a, $b ) = @_;
    my @result;
    my @letters = split //, $phrase;

    @letters = grep { /[a-z0-9]/i } @letters;
    @letters = map { lc($_) } @letters;

    die "a and m must be coprime" if (&coprime($a, $modulus) != 1);

    foreach my $letter (@letters) {
        if (!(grep {$_ eq $letter} qw/1 2 3 4 5 6 7 8 9 0/)) {

            push @result, $inv{($a * $dict{$letter} + $b) % $modulus};
        } else {

            push @result, $letter;
        }
    }
    
    return &format_encrypt(\@result);
}

sub decode {

  my ( $phrase, $a, $b ) = @_;
    my @result;
    my @letters = split //, $phrase;

    @letters = grep { /[a-z0-9]/i } @letters;
    @letters = map { lc($_) } @letters;
    
    die "a and m must be coprime" if (&coprime($a, $modulus) != 1);

    foreach my $letter (@letters) {
        if (!(grep {$_ eq $letter} qw/1 2 3 4 5 6 7 8 9 0/)) {
            
            push @result, $inv{((&minv($a) * ($dict{$letter} - $b)) % $modulus)};
        } else {

            push @result, $letter;
        }
    }

    return join "", @result;
}
1;
