package Minesweeper;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<annotate>;

sub annotate ($minefield) {

    if ($minefield eq '') {return $minefield}
    
    my @array = split '\n', $minefield;
    my $n = scalar(@array);
    my $i = 0;
    my $result = '';
    
    foreach (@array) {
        $array[$i] = [split //, $_];
        $i++;
    }
    
    my $m = scalar(@{$array[0]}); 
    my $j = 0;

    while ($j < $n) {
        $i=0;
        my $count = 0;
        while ($i < $m) {

            if ($array[$j]->[$i] eq ' ') {
            
                if (($j - 1) > -1 && ($i - 1) > -1 && $array[$j - 1]->[$i - 1] eq '*') {
                    $count++;
                }

                if (($j - 1) > -1 && $i > -1 && $array[$j - 1]->[$i] eq '*') {
                    $count++;
                }

                if (($j - 1) > -1 && ($i + 1) > -1 && $array[$j - 1]->[$i + 1] eq '*') {
                    $count++;
                }

                if ($j > -1 && ($i - 1) > -1 && $array[$j]->[$i - 1] eq '*') {
                    $count++;
                }

                if ($j > -1 && ($i + 1) > -1 && $array[$j]->[$i + 1] eq '*') {
                    $count++;
                }

                if (($j + 1) > -1 && ($i - 1) > -1 && $array[$j + 1]->[$i - 1] eq '*') {
                    $count++;
                }

                if (($j + 1) > -1 && $i > -1 && $array[$j + 1]->[$i] eq '*') {
                    $count++;
                }

                if (($j + 1) > -1 && ($i + 1) > -1 && $array[$j + 1]->[$i + 1] eq '*') {
                    $count++;
                }

                if ($count == 0) {$count = ' '}
            
                $result .= $count;
                $count = 0;
                } else {$result .= '*'}
            
            if ($i == $m-1 && $j != $n - 1) {$result .= "\n"}

            $i++;
        }
        $j++;
    }

    return $result;
}

1;
