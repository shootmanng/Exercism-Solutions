package RunLengthEncoding;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode decode>;

sub encode ($string) {
    
    my @thread = split //, $string;
    my @result = ();
    my $i = 1;
    
    for (0..scalar(@thread) - 1) {
    
        if (($_ < scalar(@thread) - 1) && ($thread[$_] eq $thread[$_+1])) {$i++}
        elsif ($i != 1) {
            push @result, $i.$thread[$_-1];
            $i = 1;
        }
        else {push @result, $thread[$_]}

    }
    return join '', @result;
}

sub decode ($string) {

    my @thread = split //, $string;
    my @result = ();
    
    for (0..scalar(@thread) - 1) {

        if (($_ < scalar(@thread) - 1) && $thread[$_] =~ /[1-9]/) {push @result, $thread[$_+1] x $thread[$_]}
        elsif (!($thread[$_-1] =~ /[1-9]/)) {push @result, $thread[$_]}
        
    }    
    return join '', @result;
}

1;
