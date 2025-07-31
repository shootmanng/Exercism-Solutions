package Triangle;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;
sub _ti {
    my ($a,$b,$c) = @_;
    my $bool1 = $a + $b >= $c;
    my $bool2 = $b + $c >= $a;
    my $bool3 = $a + $c >= $b;

    return $bool1 && $bool2 && $bool3;
}

sub is_equilateral ($triangle) {
    my @array = @$triangle;
    my $a = $array[0];
    my $b = $array[1];
    my $c = $array[2];
    
    return 0 if $a == 0 || $b == 0 || $c == 0;
    return $a == $b && $b == $c;
}

sub is_isosceles ($triangle) {
    my @array = @$triangle;
    my $a = $array[0];
    my $b = $array[1];
    my $c = $array[2];
    my $test = ($a == $b) + ($a == $c) + ($c == $b);
    
    return 0 if $a == 0 || $b == 0 || $c == 0;
    return $test > 0 && &_ti($a,$b,$c);
}

sub is_scalene ($triangle) {
    my @array = @$triangle;
    my $a = $array[0];
    my $b = $array[1];
    my $c = $array[2];
    my $test = ($a == $b) + ($a == $c) + ($c == $b);
    
    return 0 if $a == 0 || $b == 0 || $c == 0;
    return $test == 0 && &_ti($a,$b,$c);
}

1;
