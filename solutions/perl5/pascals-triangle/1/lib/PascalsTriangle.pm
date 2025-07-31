package PascalsTriangle;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<pascal_rows>;

sub pascal_rows ($rows) {

    if ($rows < 0) {die "Number of rows must be non-negative."}
    if ($rows == 0) {return ''}

    my @triangle = ('', 1, '1 1');
    my @nrow = ();
    
    
    foreach (3..$rows) {

        @nrow = split ' ', $triangle[$_ - 1];   
        print Dumper(@nrow);
        my $newr = '';
        foreach (0..scalar(@nrow) - 2) {

            $newr .= ($nrow[$_] + $nrow[$_ + 1])." ";
        }
        
        $triangle[$_] = "1 ".$newr.1
    }
    return join("\n", @triangle[1..$rows]);
}

1;
