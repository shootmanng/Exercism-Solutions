package Proverb;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<proverb>;

sub proverb ($items) {

    my $nitems = scalar(@$items);
    if ($nitems == 0) {return ""}
    if ($nitems == 1) {return "And all for the want of a @$items[0]."}

    my @result = map {"For want of a @$items[$_] the @$items[$_ + 1] was lost."} 0..$nitems - 2;
    return join("\n", @result)."\nAnd all for the want of a @$items[0].";
}

1;
