package TwelveDays;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<recite>;

my %numbers = (
    1 => "",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
);

my %days = (
    1 => "first",
    2 => "second",
    3 => "third",
    4 => "fourth",
    5 => "fifth",
    6 => "sixth",
    7 => "seventh",
    8 => "eighth",
    9 => "ninth",
    10 => "tenth",
    11 => "eleventh",
    12 => "twelfth",
);

my @things = reverse (" Drummers Drumming", " Pipers Piping", " Lords-a-Leaping"," Ladies Dancing"," Maids-a-Milking"," Swans-a-Swimming"," Geese-a-Laying"," Gold Rings"," Calling Birds"," French Hens"," Turtle Doves"," yo", "bruh");

sub recite ( $start, $end ) {
    return join("\n", map {
    if ($_ == 1) {$things[1] = "a Partridge in a Pear Tree."}
    else {$things[1] = "and a Partridge in a Pear Tree."}
    "On the $days{$_} day of Christmas my true love gave to me: ".join(", ", map {"$numbers{$_}$things[$_]"} reverse 1..$_)} $start..$end);
}

1;
