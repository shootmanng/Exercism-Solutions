package OCRNumbers;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<convert_ocr>;

sub _is_number {

    (my $num) = @_;
    my $line = "";
    
    foreach (@$num) {
    
        if (length($_) != 3) {
            die "Number of input columns should be three."
            }
        $line .= $_;
        }

    if (length($line) != 12) {die "Number of input lines should be four."}

    if ($line eq " _ | ||_|   ") {return 0}
    if ($line eq "     |  |   ") {return 1}
    if ($line eq " _  _||_    ") {return 2}
    if ($line eq " _  _| _|   ") {return 3}
    if ($line eq "   |_|  |   ") {return 4}
    if ($line eq " _ |_  _|   ") {return 5}
    if ($line eq " _ |_ |_|   ") {return 6}
    if ($line eq " _   |  |   ") {return 7}
    if ($line eq " _ |_||_|   ") {return 8}
    if ($line eq " _ |_| _|   ") {return 9} else {return "?"}
}

sub _cols {
    
    my ($array) = @_;
    my @copy = @$array;
    my @result = ();
    my $len = length($copy[0]);
    
    foreach (@copy) {
        my $i = 0;
        while ($i + 2 < $len) {
            my @row = split //, $_;
            push @result, $row[$i].$row[$i+1].$row[$i+2];
            $i += 3;
        }
    }
    return @result;
}

sub _error_checks {

    my ($arr) = @_;
    my @line = @$arr;

    foreach (@line) {
    
        if (length($_) % 3 != 0) {
            die "Number of input columns is not a multiple of three."
        }
    }

    if (scalar(@line) % 4 != 0) {die "Number of input lines is not a multiple of four."}

    my $i = 3;
    
    while ($i < scalar(@line)) {
        
        if ($line[$i] =~ /[^\s]/) {die "Incorrect format, last line should be blank."}
        $i+= 4;
    }
    return;
}

sub convert_ocr ($string) {

    my @line = split "\n", $string;
    my $result = '';
    my $j = 0;
    
    &_error_checks(\@line);
    
    my $col_num = length($line[0]);
    my $cmod = $col_num / 3;
    my $row_num = scalar(@line);
    
    
    while ($j + 3 < $row_num) {
    
        my $i = 0;
        my @cols = &_cols([$line[$j], $line[$j + 1], $line[$j + 2], $line[$j + 3]]);
        if ($j > 0) {$result .= ","}
        
        while ($i < $cmod) {
        
            $result .= _is_number([$cols[$i], $cols[$i + $cmod], $cols[$i + 2 * $cmod],    $cols[$i + 3 * $cmod]]);
    
            
            $i += 1;
        }
        $j += 4;
    }
    
    return $result;
}

1;
