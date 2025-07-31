package WordCount;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub _counter{

    my ($word, $list) = @_;
    my $i = 0;
    foreach (@$list) {
        $i++ if ($word eq lc($_));
    }
    return $i;
}

sub count_words ($sentence) {
    $sentence =~ s/[\t\n:!.?\@\$%^&]//g;
    $sentence =~ s/,/ /g;
    my @words = split / /, $sentence;
    my @key_list = ();
    my $result = {};
    
    
    foreach my $word (@words) {
        
        if ($word ne '') {
            my @check = split //, $word;
            
            shift(@check) if ($check[0] eq "\'");
            pop(@check) if ($check[-1] eq "\'");
            $word = join '', @check;
            
            push(@key_list, lc $word) unless grep {$_ eq lc($word)} @key_list;
        }
    }

    foreach (@key_list) {

        $result->{$_} = &_counter($_, \@words);
    }
   
    return $result;
}

1;
