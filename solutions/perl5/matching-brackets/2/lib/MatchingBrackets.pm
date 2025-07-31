package MatchingBrackets;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<has_matching_brackets>;

sub has_matching_brackets ($text) {

    my @pars = grep {/[\[\{\(\]\}\)]/} split //, $text;
    
    my $i = scalar(@pars);
    my ($bool1, $bool2, $bool3) = (1,1,1);
    return 1 if $i == 0;
    return 0 if $i % 2 != 0;
    
    for (0..$i/2 - 1) {
        
        if ($pars[$_] eq '[') {
            $bool1 = $bool1 && ($pars[$i - 1 - $_] eq ']' || $pars[$_ + 1] eq ']');
            splice @pars, $_ + 1, 1 if (($pars[$_ + 1] eq ']') != 0);
            return 0 if $bool1 == 0;
        } elsif ($pars[$_] eq '{') {
            $bool2 = $bool2 && ($pars[$i - 1 - $_] eq '}' || $pars[$_ + 1] eq '}');
            splice @pars, $_ + 1, 1 if (($pars[$_ + 1] eq '}') != 0);
            return 0 if $bool2 == 0;
        } elsif ($pars[$_] eq '(') {
            $bool3 = $bool3 && ($pars[$i - 1 - $_] eq ')' || $pars[$_ + 1] eq ')');
            splice @pars, $_ + 1, 1 if (($pars[$_ + 1] eq ')') != 0);
            return 0 if $bool3 == 0;
        } else {return 0}
    }
    return $bool1 || $bool2 || $bool3;
}

1;
