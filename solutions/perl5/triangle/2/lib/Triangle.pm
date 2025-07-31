package Triangle;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;
sub _ti {
    my ($s1,$s2,$s3) = @_;
    my $bool1 = $s1 + $s2 >= $s3;
    my $bool2 = $s2 + $s3 >= $s1;
    my $bool3 = $s1 + $s3 >= $s2;

    return $bool1 && $bool2 && $bool3;
}

sub is_equilateral ($triangle) {
    my @array = @$triangle;
    my $s1 = $array[0];
    my $s2 = $array[1];
    my $s3 = $array[2];
    
    return 0 if $s1 == 0 || $s2 == 0 || $s3 == 0;
    return $s1 == $s2 && $s2 == $s3;
}

sub is_isosceles ($triangle) {
    my @array = @$triangle;
    my $s1 = $array[0];
    my $s2 = $array[1];
    my $s3 = $array[2];
    my $test = ($s1 == $s2) + ($s1 == $s3) + ($s3 == $s2);
    
    return 0 if $s1 == 0 || $s2 == 0 || $s3 == 0;
    return $test > 0 && &_ti($s1,$s2,$s3);
}

sub is_scalene ($triangle) {
    my @array = @$triangle;
    my $s1 = $array[0];
    my $s2 = $array[1];
    my $s3 = $array[2];
    my $test = ($s1 == $s2) + ($s1 == $s3) + ($s3 == $s2);
    
    return 0 if $s1 == 0 || $s2 == 0 || $s3 == 0;
    return $test == 0 && &_ti($s1,$s2,$s3);
}

1;
