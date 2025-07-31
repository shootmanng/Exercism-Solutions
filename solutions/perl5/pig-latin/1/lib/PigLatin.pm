package PigLatin;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<translate>;

sub translater ($phrase) {

    my $first_vowel = length($phrase);
    my $index1 = -1;
    my $index2 = index($phrase, "qu");
    print Dumper($index2);
    my $index3 = index($phrase, "y");
    my $part1;
    my $part2;
    
    foreach (('a','e','i','o','u')) {
    
        $index1 = index($phrase, $_);
        if (($index1 < $first_vowel) && $index1 != -1) {
            $first_vowel = $index1;
        }
    }

    if ($phrase =~ /^[aeiou]/i || substr($phrase,0,2) eq "xr" || substr($phrase,0,2) eq "yt") {
    
        $phrase .= "ay";
        return $phrase;
    }  elsif ($index2 != -1 && $index2 < $first_vowel) {

        $part1 = substr($phrase, $index2 + 2);
        $part2 = substr($phrase, 0, $index2 + 2);
        print "$index2, $part1, $part2\n";
        return $part1.$part2."ay"
    } elsif ($first_vowel != length($phrase)) {
        
        $part1 = substr($phrase, $first_vowel);
        $part2 = substr($phrase, 0, $first_vowel);
        return $part1.$part2."ay"
    } elsif ($index3 != -1) {

        $part1 = substr($phrase, $index3);
        $part2 = substr($phrase, 0, $index3);
        return $part1.$part2."ay"
    }

    return;    
}

sub translate ($phrase) {

    my $result;
    my @phrase = split ' ', $phrase;

    if (scalar(@phrase) == 1) {return &translater($phrase)}
    else {
        foreach (@phrase) {
            my $part = &translater($_);
            $result .=  "$part ";
        }
        chop($result);
        return $result;
    }
    return;
}
1;
