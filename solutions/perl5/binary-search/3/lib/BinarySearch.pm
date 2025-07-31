package BinarySearch;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;
# THE FIRST TWO ITERATIONS ARE NOT CORRECT
sub _index_is_odd {
    my ($ind) = @_;
    #checking if last index is odd
    $ind = scalar(@$ind) - 1;

    if ($ind % 2 == 0) {return 0} else {return 1}
}

sub binary_search ( $array, $value ) {
    my $i = 0;
    my $oind = scalar(@$array) - 1;
    my $len = 0;
    my $odd = 0;
    my @tail= ();
    
    print $oind, " oind\n";
    
    while ($i < 1000) {

        # update values
        $len = scalar(@$array);
        $odd = &_index_is_odd($array);
        
        #silly cases
        if (0 <= $len < 2 && @$array[0] == $value && $i == 0) {return 0}
        elsif ($len == 0 || $oind < 0) {die "value not in array"} 

        #pick middle
        if (!$odd) {
            $len = ($len + 1)/2;
            } else {
                $len /= 2;
            }
        
        my $ind = $len - 1; 
        print $ind, " ind\n";
        
        #algorithm
        if ((@$array[$ind] == $value) && ($i == 0)) {
            return $ind;
        } elsif (@$array[$ind] == $value && ($oind * $ind) != 0) {
            $oind -= scalar(@$array) - $ind - 1;
            return $oind;
        } elsif (@$array[$ind] != $value && ($ind == 0)) {
            die "value not in array";
        } elsif (@$array[$ind] == $value && ($ind == 0) && $oind == 1) {
            return 0;
        } elsif (@$array[$ind] == $value) {
            return $oind;
        } elsif (@$array[$ind] > $value) {
            @tail = splice(@$array, $len);
            $oind -= scalar(@tail);
        } else {
            @$array = splice(@$array, $len);
        }
        print "$len "," $ind"," $oind", " old\n";
        $i++;
        print $i, "\n";
        print "$len "," $ind"," $oind", " new\n";
        #
        print Dumper(@$array), "\n";
    }
    print "Timed out.\n";
    return;
}

1;
