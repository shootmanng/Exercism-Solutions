package RNA;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<to_rna>;

sub to_rna ($dna) {

    if ($dna eq "") {
        
        return "";
    }
    
    if ($dna =~ /[^ACGT]/) {
        
        die "This is not a DNA strand, contains incorrect nucleotides."
        }
    
    my @seq = split //,$dna;
    my $result = '';
    my %pair = (
        G => 'C',
        C => 'G',
        T => 'A',
        A => 'U',
    );
    
    foreach (@seq) {

        $result .= $pair{$_};
    }

    return $result;
}

1;
