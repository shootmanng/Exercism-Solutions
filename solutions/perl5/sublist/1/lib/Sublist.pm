package Sublist;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<compare_lists>;

sub compare_lists ( $list1, $list2 ) {

    #silly cases
    return "equal" if scalar(@$list1) == scalar(@$list2) && scalar(@$list1) == 0;
    return "superlist" if scalar(@$list2) == 0;
    return "sublist" if scalar(@$list1) == 0;

    #rest of code (if you dont add the extra comma on the end of the joins 1,2 and 1,22 will give a sublist)
    my ($str1, $str2) = (join(',', @$list1).',', join(',', @$list2).',');
    
    if ($str1 eq $str2) {return "equal"}
    elsif(index($str1,$str2) != -1) {return "superlist"}
    elsif(index($str2,$str1) != -1) {return "sublist"}
    else {return "unequal"}
}

1;
