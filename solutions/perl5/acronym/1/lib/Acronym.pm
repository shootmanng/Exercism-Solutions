package Acronym;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<abbreviate>;

sub abbreviate ($phrase) {
    my @array = split //, $phrase;
    @array = map {
    
        if (($array[$_-1] eq " " || $array[$_-1] eq "-" || $array[$_-1] eq "_") && $_ >1) {
        
            $array[$_] = ucfirst($array[$_]);
        } 
        elsif ($_ > 0) {$array[$_] = lc($array[$_])}
        else {$array[$_] = $array[$_]}
        
    } 0..scalar(@array) - 1;
    
    my @result = grep {/[A-Z]/} @array;
    
    return join '', @result;
}

1;
