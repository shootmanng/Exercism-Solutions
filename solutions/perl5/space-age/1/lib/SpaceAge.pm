package SpaceAge;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<age_on_planet>;

sub _onEarth($seconds) {
    return $seconds/31557600;
}
sub _round($ans) {
    my $result = sprintf("%.2f", $ans);
    return $result * 1;
}
sub age_on_planet ( $planet, $seconds ) {

    return &_round(&_onEarth($seconds) / 0.2408467) if $planet eq "Mercury";
    return &_round(&_onEarth($seconds) / 0.61519726) if $planet eq "Venus";
    return &_round(&_onEarth($seconds)) if $planet eq "Earth";
    return &_round(&_onEarth($seconds) / 1.8808158) if $planet eq "Mars";
    return &_round(&_onEarth($seconds) / 11.862615) if $planet eq "Jupiter";
    return &_round(&_onEarth($seconds) / 29.447498) if $planet eq "Saturn";
    return &_round(&_onEarth($seconds) / 84.016846) if $planet eq "Uranus";
    return &_round(&_onEarth($seconds) / 164.79132) if $planet eq "Neptune";
    die "not a planet";
    
}

1;
