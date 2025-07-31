package Say;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<say_number>;

sub _ones {
    my ($number) = @_;

    my %hash = (1 => 'one',
                2 => 'two',
                3 => 'three',
                4 => 'four',
                5 => 'five',
                6 => 'six',
                7 => 'seven',
                8 => 'eight',
                9 => 'nine');
                
    return $hash{$number};
}

sub _tens {
    my ($number) = @_;

    my %hash = (2 => 'twenty',
                3 => 'thirty',
                4 => 'forty',
                5 => 'fifty',
                6 => 'sixty',
                7 => 'seventy',
                8 => 'eighty',
                9 => 'ninety');
                
    return $hash{$number};
}

sub _teens {

my ($number) = @_;

    my %hash = (10 => 'ten',
                11 => 'eleven',
                12 => 'twelve',
                13 => 'thirteen',
                14 => 'fourteen',
                15 => 'fifteen',
                16 => 'sixteen',
                17 => 'seventeen',
                18 => 'eighteen',
                19 => 'nineteen');
                
    return $hash{$number};
}

sub say_number ($number) {

    die "input out of range" if $number < 0;
    die "input out of range" if $number > 999_999_999_999;
    return 'zero' if $number == 0;
    
    my @numbers = split //,$number;
    my @result = ();
    
    foreach (0..scalar(@numbers)-1) {
        
        unshift @result, &_ones($numbers[-1]) if $_ == 0 && $numbers[-2] != 1;
        unshift @result, &_teens($number)  if $_ == 1 && $numbers[-2] == 1;
        unshift @result, &_tens($numbers[-1-$_]).'-' if $_ == 1 && $numbers[-1] != 0 && $numbers[-2] != 1;
        unshift @result, &_tens($numbers[-1-$_]) if $_ == 1 && $numbers[-1] == 0;
        unshift(@result, &_ones($numbers[-1-$_])." hundred ") if $_ == 2 && $numbers[-1-$_] != 0;

        
        unshift(@result, &_ones($numbers[-1-$_])." thousand ") if $_ == 3 && $numbers[-1-$_] != 0 && $numbers[-2-$_] != 1;
        unshift @result, &_teens($number)." thousand "  if $_ == 3 && $numbers[-2-$_] == 1;
        unshift @result, &_tens($numbers[-1-$_]).'-' if $_ == 4 && $numbers[-1-$_] != 0 && $numbers[-2 - $_] != 1;
        unshift @result, &_tens($numbers[-1-$_]) if $_ == 4 && $numbers[-$_] == 0;
        unshift(@result, &_ones($numbers[-1-$_])." hundred ") if $_ == 5 && $numbers[-1-$_] != 0;

        unshift(@result, &_ones($numbers[-1-$_])." million ") if $_ == 6 && $numbers[-1-$_] != 0 && $numbers[-2-$_] != 1;
        unshift @result, &_teens($number)." million "  if $_ == 6 && $numbers[-2-$_] == 1;
        unshift @result, &_tens($numbers[-1-$_]).'-' if $_ == 7 && $numbers[-1-$_] != 0 && $numbers[-2 - $_] != 1;
        unshift @result, &_tens($numbers[-1-$_]) if $_ == 7 && $numbers[-$_] == 0;
        unshift(@result, &_ones($numbers[-1-$_])." hundred ") if $_ == 8 && $numbers[-1-$_] != 0;

        unshift(@result, &_ones($numbers[-1-$_])." billion ") if $_ == 9 && $numbers[-1-$_] != 0 && $numbers[-2-$_] != 1;
        unshift @result, &_teens($number)." billion "  if $_ == 9 && $numbers[-2-$_] == 1;
        unshift @result, &_tens($numbers[-1-$_]).'-' if $_ == 10 && $numbers[-1-$_] != 0 && $numbers[-2 - $_] != 1;
        unshift @result, &_tens($numbers[-1-$_]) if $_ == 10 && $numbers[-$_] == 0;
        unshift(@result, &_ones($numbers[-1-$_])." hundred ") if $_ == 11 && $numbers[-1-$_] != 0;
        
        } 
        
    my $result = join '', @result;
    $result =~ s/\s+\z//;
    return $result;
}

1;
