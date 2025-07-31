package EliudsEggs;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<egg_count>;

sub egg_count ($number) {
    
    my $i = 0;

    while ($number > 0) {
        $i = $i + ($number % 2);
        $number = int($number / 2);
    }
    return $i;
}

1;
