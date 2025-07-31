# Declare package 'Bob'
package Bob;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub splitter {
    my ($msg) = @_;
    my @msg = split //, $msg;
    return \@msg;
}

sub hey {
    
    my ($msg) = @_;
    my @msg = @{&splitter($msg)};
    my @msgSpec = ();
    my $msgSpec = 0;
    my $Umsg = 0;
    
    @msgSpec = grep {/[^a-zA-Z \t\r\n]/} @msg;
    @msg = grep {/[a-zA-Z?]/} @msg;
    $msg = join('', @msg);
    $msgSpec = join('', @msgSpec);
    $Umsg = uc($msg);
    
    
    if ((scalar(@msg) == 1) && (scalar(@msgSpec) > 1) && (@msgSpec[-1] eq '?')) {
        return "Sure.";
    } elsif ((scalar(@msg) == 0) && (scalar(@msgSpec) > 1)) {
        return "Whatever.";    
    } elsif (($msg eq $Umsg) && (@msg[-1] eq '?')) {
        return "Calm down, I know what I'm doing!";
    } elsif ((scalar(@msg) == 0) && (scalar(@msgSpec) == 0)) {
        return "Fine. Be that way!";
    } elsif ($msg eq $Umsg) {
        return "Whoa, chill out!";
    } elsif (@msg[-1] eq '?') {
        return "Sure.";
    } else {
        return "Whatever."; 
    }
}

1;
