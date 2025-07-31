package House;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<recite>;

sub recite ( $start, $end ) {

    my @result = ("bruh");
    my $rhyme;
    my $i = 1;
    
    push @result, "This is the house that Jack built.";

    push @result, "This is the malt that lay in ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the rat that ate ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the cat that killed ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the dog that worried ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the cow with the crumpled horn that tossed ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the maiden all forlorn that milked ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the man all tattered and torn that kissed ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the priest all shaven and shorn that married ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the rooster that crowed in the morn that woke ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the farmer sowing his corn that kept ".substr($result[$i], 8);
    $i++;
    
    push @result, "This is the horse and the hound and the horn that belonged to ".substr($result[$i], 8);

    if ($start == $end) {
    
        return @result[$start..$end];
        } else {

            $rhyme = join("\n", @result[$start..$end]);
            chop($rhyme);
            $rhyme .= '.';
            return $rhyme;
        }
        
}

1;
