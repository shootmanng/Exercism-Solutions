package AtbashCipher;
use Data::Dumper;
 
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

sub hasher {
    my ($arr1, $arr2) = @_;
    my %cipher;
    
    foreach (0..25) {
        $cipher{@$arr1[$_]} = @$arr2[$_];
    }

    return \%cipher;
}

sub split {
    my ($word) = @_;
    my @word = split(//, $word);
    return \@word;
}


sub cipher ($phrase) {
    my @word = grep {/[a-zA-z0-9]/} @{&split($phrase)};
    my $alphabet = 'abcdefghijklmnopqrstuvwxyz';
    my $tebahpla = reverse $alphabet;
    # issue before: the below was in encode block and was being reshuffled
    #every time
    $alphabet = &split($alphabet);
    $tebahpla = &split($tebahpla);
    
    foreach (0..scalar(@word)-1) {
        if ($word[$_] eq lc($word[$_]) && $word[$_] =~ /[^0-9]/) {
        $word[$_] = &hasher($alphabet, $tebahpla) ->{$word[$_]};
       } 
       
        if ($word[$_] eq uc($word[$_]) && $word[$_] =~ /[^0-9]/) {
           $word[$_] = lc(&hasher($alphabet, $tebahpla) ->{lc($word[$_])});
        }
    }
    return \@word;
}

sub encode_atbash ($phrase) {
    my @word = @{&cipher($phrase)};
    my $result = '';
    
    foreach (0..scalar(@word)-1) {
       if((($_ + 1) % 5) == 0 && ($_ != scalar(@word)- 1)) {$result .= "$word[$_] " } 
       else {$result .= $word[$_]}
    }
   return $result;
}


sub decode_atbash ($phrase) {
    my @word = @{&cipher($phrase)};
    my $result = '';
    
    foreach (0..scalar(@word)-1) {
       $result .= $word[$_]
    }
   return $result;
}

1;
