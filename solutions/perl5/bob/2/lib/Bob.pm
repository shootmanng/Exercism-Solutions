# Declare package 'Bob'
package Bob;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub trimmer {

    my ($msg) = @_;
    my @msg = split(//, $msg);
    
    while((scalar(@msg) != 0) && ($msg[0] =~ /^\s/ || ($msg[-1] =~ /^\s/))) {
        if ($msg[0] =~ /^\s/) {
            shift @msg;
        } if ($msg[-1] =~ /^\s/) {
            pop @msg;
        }
    }
    return join('', @msg);
}

sub hey {
    
    my ($msg) = @_;
    $msg = &trimmer($msg);
    
    # bool checks
    
    my $is_caps = (uc($msg) eq $msg) && ($msg ne '') && ($msg =~ /[a-zA-Z]/); 
    my $is_question = $msg =~ /\?$/;
    
    return "Sure." if ($is_question && !$is_caps);
    return "Whoa, chill out!" if (!$is_question && $is_caps);
    return "Calm down, I know what I'm doing!" if ($is_question && $is_caps);
    return "Fine. Be that way!" if ($msg eq '');
    return "Whatever."
    
}

1;
