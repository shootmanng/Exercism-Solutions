package BottleSong;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<sing>;

my %numbers = (
    0 => 'no',
    1  => 'one',
    2  => 'two',
    3  => 'three',
    4  => 'four',
    5  => 'five',
    6  => 'six',
    7  => 'seven',
    8  => 'eight',
    9  => 'nine',
    10 => 'ten',
);

sub bottleq {
    my ($num) = @_;

    if ($num == 1) {return "bottle"}
    else {return "bottles"}
}

my @stanza = (" hanging on the wall,\n", " hanging on the wall,\n", "And if one green bottle should accidentally fall,\n", "There'll be ", " hanging on the wall.");

sub sing ( $bottles, $verses ) {
    return join("\n", map{ucfirst($numbers{$bottles - $_})." green ".&bottleq($bottles - $_).$stanza[0].ucfirst($numbers{$bottles - $_})." green ".&bottleq($bottles - $_).$stanza[1].$stanza[2].$stanza[3].$numbers{$bottles - $_ - 1}." green ".&bottleq($bottles - $_ - 1).$stanza[4]."\n"} 0 .. $verses - 1);
}

1;
