package FoodChain;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<recite>;

sub recite ( $start, $end ) {

    my @result = ("bruh");
    my @animals = ("bruh", "fly", "spider that wriggled and jiggled and tickled inside her", "bird", "cat", "dog", "goat", "cow", "horse");
    my @actions = ("bruh", "bro", "It wriggled and jiggled and tickled inside her", "How absurd to swallow a", "Imagine that, to swallow a", "What a hog, to swallow a", "Just opened her throat and swallowed a", "I don't know how she swallowed a", "She's dead, of course!");

    push @result, "I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die.";

    foreach (2..8) {

        if ($_ == 2) {
        
            push @result, "I know an old lady who swallowed a spider.\n$actions[$_].\nShe swallowed the spider to catch the $animals[$_-1].\n".substr($result[1],index($result[1], "\n") + 1)
        } elsif ($_ < 8) {

            my $fpos = index($result[$_ - 1], "\n");
            my $spos = index($result[$_ - 1], "\n", $fpos + 1);
            push @result, "I know an old lady who swallowed a $animals[$_].\n$actions[$_] $animals[$_]!\nShe swallowed the $animals[$_] to catch the $animals[$_-1].\n".substr($result[$_ - 1],index($result[$_ - 1], "\n", $spos) + 1)
        } else {

            push @result, "I know an old lady who swallowed a $animals[$_].\n$actions[$_]"
        }
        #push @result, 
    }
    print Dumper(@result);
    return join("\n\n", @result[$start..$end]);
}

1;
