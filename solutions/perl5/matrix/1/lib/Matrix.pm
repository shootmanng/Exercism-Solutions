package Matrix;

use v5.40;
use Data::Dumper;

use Exporter qw<import>;
our @EXPORT_OK = qw<extract_row extract_column>;

sub extract_row ( $matrix, $row ) {
    
    if (length($matrix) == 1) {return [$matrix]}

    my @arr1 = split '\n', $matrix;
    my $i = 0;
    my @values = ();
    
    while ($i < scalar(@arr1)) {
        push @values, [split ' ', $arr1[$i]];
        $i++;
        }
    return $values[$row - 1];    
}

sub extract_column ( $matrix, $column ) {

    if (length($matrix) == 1) {return [$matrix]}

    my @arr1 = split '\n', $matrix;
    my $i = 0;
    my @values = ();
    
    while ($i < scalar(@arr1)) {
        push @values, [split ' ', $arr1[$i]];
        $i++;
        }

    my $n = scalar(@values);
    my $cols = [];
    
    foreach (0..$n - 1) {
        push @$cols, $values[$_][$column - 1]
    }
    
    return $cols;
}

1;
