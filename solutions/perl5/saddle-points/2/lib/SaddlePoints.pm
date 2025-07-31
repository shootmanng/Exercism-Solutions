package SaddlePoints;
use List::Util 'min', 'max';
use v5.40;
use Data::Dumper;

use Exporter qw<import>;
our @EXPORT_OK = qw<saddle_points>;
#bro
sub saddle_points ($matrix) {

    my $result = [];
    my $row_num = scalar(@$matrix);
    my $col_num = scalar(@{$matrix -> [0]});
    my $cols = [];
    my ($i,$j) = (0,0);
    my @col_saddle = ();
    my @row_saddle = ();
    
    if ($matrix->[0]->[0] eq '') {return [@$result]}

    while ($i < $col_num) {
        
        my $col = [];
        $j = 0;
        
        while ($j < $row_num) {

            push @$col, $matrix->[$j]->[$i];
            $j++;
        }

        push @$cols, $col;
        $i++;
    }
    $i = 0;
    while ($i < $col_num) {
        
        $j = 0;
        
        while ($j < $row_num) {
       
            if ($matrix->[$j]->[$i] == max(@{$matrix->[$j]}) && $matrix->[$j]->[$i] == min(@{${$cols}[$i]})) {
            
                push @col_saddle, $i + 1;
                push @row_saddle, $j + 1;
            } 
            $j++;
        }
       
        $i++;
    }

    $i = 0;
    
    while ($i < @col_saddle) {
        
        push @$result, {'column' => $col_saddle[$i], 'row' => $row_saddle[$i]};
        $i++;
    }

    print Dumper(\@col_saddle), Dumper(\@row_saddle) ;
    return $result;
}

1;
