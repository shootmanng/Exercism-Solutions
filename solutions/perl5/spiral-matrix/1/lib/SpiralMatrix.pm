package SpiralMatrix;

use v5.34.0;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<spiral_matrix>;

sub _up{
    my ($count, $row, $col, $mx) = @_;
    
    while (!defined(${$mx->[$row]}[$col])) {

        ${$mx->[$row]}[$col] = $count;
        $count++;
        $row--;
    }
    return $count, $row + 1, $col + 1;
}

sub _down{
    my ($count, $row, $col, $mx) = @_;

     while (!defined(${$mx->[$row]}[$col])) {

        ${$mx->[$row]}[$col] = $count;
        $count++;
        $row++;
    }
    
    return $count, $row - 1, $col - 1;
}

sub _left{
    my ($count, $row, $col, $mx) = @_;

     while (!defined(${$mx->[$row]}[$col])) {

        ${$mx->[$row]}[$col] = $count;
        $count++;
        $col--;
    }
    return $count, $row - 1, $col + 1;

    
}

sub _right{
    my ($count, $row, $col, $mx) = @_;
    say $count, " BEFORE";
    while (!defined(${$mx->[$row]}[$col])) {

        ${$mx->[$row]}[$col] = $count;
        $count++;
        $col++;
    }
    
    return $count, $row + 1, $col - 1;

    
}

sub spiral_matrix {

    my ($size) = @_;
    my $mx = [];
    # stupid case
    return $mx if $size == 0;
    
    my $i = $size + 1;
    
    #fill top row
    push @$mx, [1..$size];

    #fill last column
    while (scalar(@$mx) < $size) {
        push @$mx, [$i];
        $i++;
    }

    #fill bottom row
    while (scalar(@{$mx->[$size - 1]}) < $size) {
        unshift @{$mx->[$size - 1]}, $i;
        $i++;
    }
    
    #fill the rest of the mx with undef
    for my $j (1..$size-2) {
        while (scalar(@{$mx->[$j]}) < $size) {
            unshift @{$mx->[$j]}, undef;
        }
    }
    
    my $j = $size - 2;
    my $k = 0;
    my $op = 0;
    
    #rest of mx
    while ($i < $size * $size + 1) {
        
        $op = $op % 4;
        
        ($i, $j, $k) = &_up($i,$j,$k,$mx) if $op == 0;
        ($i, $j, $k) = &_right($i,$j,$k,$mx) if $op == 1;
        ($i, $j, $k) = &_down($i,$j,$k,$mx) if $op == 2;
        ($i, $j, $k) = &_left($i,$j,$k,$mx) if $op == 3;
        
        $op++;
            
    }
    
    return $mx
}

1;