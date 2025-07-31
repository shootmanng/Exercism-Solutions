package BookingUpForBeauty;

use v5.40;

# Suggested datetime modules you can use:
use Time::Piece;
use DateTime::Tiny;

# Recommended, commented out for portability.
use Const::Fast;

use Exporter ('import');
our @EXPORT_OK = qw<appointment_has_passed is_afternoon_appointment describe_appointment>;

my $STRPTIME_FORMAT = '%Y-%m-%d' . 'T' . '%H:%M:%S';
#const $STRPTIME_FORMAT => $STRPTIME_FORMAT;

# Private subroutines conventionally start with an underscore.
# It isn't necessary, but provided for convenience.
sub _parse_datetime ($date_string) {
    return $date_string;
}

sub appointment_has_passed ($date_string) {
    my $t = gmtime;
    my $t2 = Time::Piece -> strptime($date_string, '%Y-%m-%dT%H:%M:%S');
    return ($t2 - $t < 0); 
    # these are unnecessary as its a "bool" already {return 1} else {return 0}
}

sub is_afternoon_appointment ($date_string) {
    my $t = Time::Piece -> strptime($date_string, '%Y-%m-%dT%H:%M:%S');
    
    return (12 <= $t -> hour < 18);
    # same here {return 1} else {return 0}
}

sub describe_appointment ($date_string) {
    my $t = Time::Piece -> strptime($date_string, '%Y-%m-%dT%H:%M:%S');
    if (12 <= $t -> hour < 24) {
        return return sprintf('You have an appointment on %02d/%02d/%04d %d:%02d %s', $t -> mon, $t -> mday, $t -> year, $t -> hour - 12, $t -> minute, 'PM');
    } else {
        # below for the hour, we need to mod out by 12 to get on 12 hour blocks
        # but 12:13 AM will have a 0 hour, and 0 is "false" so the or operator (||) 
        #goes to 12, which is nonzero so "true" and prints that
        return sprintf('You have an appointment on %02d/%02d/%04d %d:%02d %s', $t -> mon, $t -> mday, $t -> year, $t -> hour % 24 || 12, $t -> minute, 'AM');
    }
}

1;
