package Anagram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams unwrap>;

#splits a single string into a list with each letter then sorts it and returns
sub unwrap{
    my ($word) = @_;
    my @chars = split //, $word;
    @chars = sort @chars;
    $word = join '', @chars;
    return $word;
}
sub match_anagrams {
    my ( $subject, $candidates ) = @_;
    my @matches;
    #anagrams will have matching unwraps, but also check its not just the same word
    foreach (@$candidates) {
        #unwraps must go on outside of uc() otherwise the matching
        #wont be case insensitive
        if (&unwrap(uc($subject)) eq &unwrap(uc($_)) && uc($subject) ne uc($_)) {
            push @matches, $_;
        }
    }
    return \@matches;
}

1;
