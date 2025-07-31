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
            say $bool1, " bruh";
            $bool1 = $bool1 && ($pars[$i - 1 - $_] eq ']' || $pars[$_ + 1] eq ']');
            splice @pars, $_ + 1, 1 if ($pars[$_ + 1] eq ']' != 0);
            say $bool1 ," bruh2";
            return 0 if $bool1 == 0;
        } elsif ($pars[$_] eq '{') {
            say $bool2, " bro";
            $bool2 = $bool2 && ($pars[$i - 1 - $_] eq '}' || $pars[$_ + 1] eq '}');
            say Dumper(@pars);
            say $pars[$_ + 1];
            say ($pars[$_ + 1] eq '}') != 0, " DUDE";
            splice @pars, $_ + 1, 1 if (($pars[$_ + 1] eq '}') != 0);
            say Dumper(@pars);
            say $bool2, " bro2";
            return 0 if $bool2 == 0;
        } elsif ($pars[$_] eq '(') {
            say $bool3, " dog";
            $bool3 = $bool3 && ($pars[$i - 1 - $_] eq ')' || $pars[$_ + 1] eq ')');
            splice @pars, $_ + 1, 1 if ($pars[$_ + 1] eq ')' != 0);
            say $bool3, " dog2";
            return 0 if $bool3 == 0;
        } else {return 0}
    }
    return $bool1 || $bool2 || $bool3;
    #my @left1 = grep {/[ \[ ]/} split //, $text;
    #my @left2 = grep {/[ \{ ]/} split //, $text;
    #my @left3 = grep {/[ \( ]/} split //, $text;
    #my @right1 = grep {/[ \] ]/} split //, $text;
    #my @right2 = grep {/[ \} ]/} split //, $text;
    #y @right3 = grep {/[ \) ]/} split //, $text;
    #return ($#left1 == $#right1) && ($#left2 == $#right2) && ($#left3 == $#right3);
}

1;
