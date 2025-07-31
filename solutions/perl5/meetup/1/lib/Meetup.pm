package Meetup;

use v5.40;
use DateTime;
use Exporter qw<import>;
our @EXPORT_OK = qw<meetup>;

sub meetup ($desc) {
    my %months = (
        January   => 1,
        February  => 2,
        March     => 3,
        April     => 4,
        May       => 5,
        June      => 6,
        July      => 7,
        August    => 8,
        September => 9,
        October   => 10,
        November  => 11,
        December  => 12,
    );
    my %dow = (
        Monday => 1,
        Tuesday => 2,
        Wednesday => 3,
        Thursday => 4,
        Friday => 5,
        Saturday => 6,
        Sunday => 7,
    );
    my ($occ, $day, $junk, $month, $year) = split ' ', $desc;
    my $dt = DateTime->new(
    year   => $year,
    month  => $months{$month},
    day    => 1,
    );
    
    while ($dt -> day_of_week != $dow{$day}) {
        
        $dt->add(days => 1);
    }

    my $dt2 = $dt->clone;
    
    
    if ($occ eq "First") {return $dt->ymd}
    
    if ($occ eq "Second") {

        $dt->add(days => 7);
        return $dt->ymd;
        }
        
    if ($occ eq "Third") {

        $dt->add(days => 14);
        return $dt->ymd;
        }
        
    if ($occ eq "Fourth") {

        $dt->add(days => 21);
        return $dt->ymd;
        }
        
    if ($occ eq "Teenth") {
        while ($dt->day < 13) {
            $dt->add(days => 7);
        }
        return $dt->ymd;
        }
    
    $dt->add(days => 21);
    $dt2->add(days => 28);

    if ($dt2->month != $months{$month}) {
        return $dt->ymd;
    } else {
        return $dt2->ymd;
    }
}

1;
