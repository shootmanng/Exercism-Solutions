package RotationalCipher;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<caesar_cipher>;

our @letters = 'a' .. 'z';
our @Letters = 'A' .. 'Z';
our %numltr=();
our %ltrnum=();
our %numLtr=();
our %Ltrnum=();

sub caesar_cipher ( $text, $shift_key ) {
    
    foreach (0..25) {
        $numltr{$_} = $letters[$_];
        $ltrnum{$letters[$_]} = $_;
        $numLtr{$_} = $Letters[$_];
        $Ltrnum{$Letters[$_]} = $_;
    }

    my @result = map {
        if ($_ =~ /[ ,'.?!0-9]/) {
            $_;
        } elsif ($_ eq uc($_)) {
            $numLtr{($Ltrnum{$_} + $shift_key) % 26};
        } else {$numltr{($ltrnum{$_} + $shift_key) % 26}}
    } (split //, $text); 
        
   return join '',@result; 
}

1;
