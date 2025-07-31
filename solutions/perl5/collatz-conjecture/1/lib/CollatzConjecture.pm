package CollatzConjecture;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<steps>;

sub steps ($number) {
    my $i = 0;

    die "Only positive integers are allowed" if $number < 1;
    
    while ($number != 1) {

        if ($number % 2 == 0) {
            $number = $number / 2;
        } else {

            $number = 3 * $number + 1;
        }
        $i++;
    }
    return $i;
}

1;
