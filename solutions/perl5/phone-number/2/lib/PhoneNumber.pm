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

    if ($number =~ /[a-zA-z]/) {die $errors[3]}
    elsif ($number =~ /[^0-9-.()+ ]/) {die $errors[4]}
}

sub _error_checker_two {
    
    my @numbers = @_;
    
    if (scalar(@numbers) == 11 && @numbers[0] != 1) {die $errors[0]}
    
    if (scalar(@numbers) == 11) {shift @numbers}

    if (scalar(@numbers) > 11) {die $errors[1]}

    if (scalar(@numbers) < 10) {die $errors[2]}

    if (@numbers[0] == 0) {die $errors[5]}

    if (@numbers[0] == 1) {die $errors[6]}

    if (@numbers[3] == 0) {die $errors[7]}

    if (@numbers[3] == 1) {die $errors[8]}

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
