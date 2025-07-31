package Allergies;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

sub _conversion  {

    my ($score) = @_;
    
    # stupid cases
    # note: $score == undef is bad, used defined($score)
    if ($score == 0 || !defined($score)) {return [0]}
    
    my $dividend = $score;
    my @result = ();

    #convert to binary
    
    while ($dividend >= 1) {
        unshift(@result, $dividend % 2);
        $dividend = int($dividend / 2);
    }

    # if array shorter than 8, add 0s

    while (scalar(@result) < 8) {unshift(@result, 0)}

    # if longer, concatenate

    while(scalar(@result) > 8) {shift(@result)}
    
    return \@result;
}

my %allergies = (
    cats => 0,
    pollen => 1,
    chocolate => 2,
    tomatoes => 3,
    strawberries => 4,
    shellfish => 5,
    peanuts => 6,
    eggs => 7,
);

        
sub allergic_to ( $item, $score ) {
    
    my $bin = &_conversion($score);
    # stupid entries are false
    if (scalar(@$bin) == 1 && @$bin[0] ==  0) {return 0}
    
    return @$bin[$allergies{$item}];
}

sub list_allergies ($score) {

    my @result = ();
    my @key = qw/cats pollen chocolate tomatoes strawberries shellfish peanuts eggs/;
    my $bin = &_conversion($score);
    
    # stupid entries are false
    if (scalar(@$bin) == 1 && @$bin[0] ==  0) {return []}

    my $i=0;

    while ($i < 8) {
        my $val = $key[$i] x @$bin[$i];
        if ($val ne '') {push(@result, $val)};
        $i++;
    }
    return \@result;
}

1;
