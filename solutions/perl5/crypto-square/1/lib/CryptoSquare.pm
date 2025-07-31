package CryptoSquare;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<cipher>;

# Issue: had an if that should of been an elsif because it depended on the previous if (picking r and c)

sub normalize {

    my ($phrase) = @_;
    my @phrase = split(//, $phrase);
    @phrase = grep {/[a-zA-Z0-9]/} @phrase;
    return  @phrase;
}

sub chunk {

    my ($line, $last) = @_;
    my @remaining = @$line; 
    splice(@remaining, $last);
    return \@remaining;
}

sub cipher ($text) {

    my @lines = &normalize(lc($text));
    $text = join('', @lines);
    my $c = 0;
    my $r = 0;
    my $parity = 0;
    my @sq = ();
    
    # cipher not necessary for empty or strings with 1 letter
    if ( 0 <= length($text) <= 1) {return $text}

    #cipher, first get r and c
    while ($r * $c < length($text)) {
       
        if ($parity == 1) {
         $r++;
         $parity = 0;
        } elsif ($parity == 0) {
         $c++;
         $parity = 1;
        }
    }
    
    my $n = length($text) % $c;
    
    # make square
    foreach (0..$r - 1) {

        if ($_ < $r - 1) {
            
            $sq[$_] = &chunk(\@lines, $c);
            @lines = splice(@lines, $c);
        } else {
            $sq[$_] = \@lines
        }
    }
    
    # fill out last row with dummy characters to be removed
    while (scalar(@{$sq[$r-1]}) < $c) {
        push(@{$sq[$r-1]}, ' ')
    }
    
    # print out code with formatting

    my $i = 0;
    my @result = ();
    my $encoded = '';
    
    while ($i < $c) {
        my $j = 0;
        while ($j < $r) {
            push(@result, ${$sq[$j]}[$i]);
            $j++;
        }
        $i++;
    }
    $i=0;

    #format output
    foreach (@result) {
        if (((($i + 1) % $r) == 0) && ($i + 1 != scalar(@result))) {
            $encoded .= "$_ "
        } else { $encoded .= $_}
        
        $i++;
    }
    return $encoded;
}

1;
