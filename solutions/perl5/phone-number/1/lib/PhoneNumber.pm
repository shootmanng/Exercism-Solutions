package PhoneNumber;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<clean_number>;

my @errors = (
    '11 digits must start with 1',
    'must not be greater than 11 digits',
    'must not be fewer than 10 digits',
    'letters not permitted',
    'punctuations not permitted',
    'area code cannot start with zero',
    'area code cannot start with one',
    'exchange code cannot start with zero',
    'exchange code cannot start with one',
);

sub _error_checker_one {

    my ($number) = @_;

    if ($number =~ /[a-zA-z]/) {die "letters not permitted"}
    elsif ($number =~ /[^0-9-.()+ ]/) {die "punctuations not permitted"}
}

sub _error_checker_two {
    
    my @numbers = @_;
    
    if (scalar(@numbers) == 11 && @numbers[0] != 1) {die '11 digits must start with 1'}
    
    if (scalar(@numbers) == 11) {shift @numbers}

    if (scalar(@numbers) > 11) {die 'must not be greater than 11 digits'}

    if (scalar(@numbers) < 10) {die 'must not be fewer than 10 digits'}

    if (@numbers[0] == 0) {die 'area code cannot start with zero'}

    if (@numbers[0] == 1) {die 'area code cannot start with one'}

    if (@numbers[3] == 0) {die 'exchange code cannot start with zero'}

    if (@numbers[3] == 1) {die 'exchange code cannot start with one'}

    return @numbers;
}

sub clean_number ($number) {

    &_error_checker_one($number);
    
    my @numbers = split '', $number;
    @numbers = grep { /[0-9]/ } @numbers;
    
    @numbers = &_error_checker_two(@numbers);    
    
    return join('', @numbers);
}

1;
