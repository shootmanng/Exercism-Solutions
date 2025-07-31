package Luhn;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($number) {

    if ($number =~ /[^0-9\s]/) {return 0}
    
    my @arr = split //, $number;
    @arr = grep {/[0-9]/} @arr;
    
    if (scalar(@arr) <= 1) {return 0}

    my $i = 2;
    my $sum = 0;
    
    while ($i <= scalar(@arr)) {
        if (@arr[-$i] * 2 > 9) {@arr[-$i] = @arr[-$i] * 2 - 9}
        else {@arr[-$i] = @arr[-$i] * 2}
        $i += 2;
    }

    foreach (@arr) {
        $sum += $_;
    }
    return ($sum % 10 == 0); 
}

1;
