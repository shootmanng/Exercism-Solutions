package RNA;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<to_rna>;

sub to_rna ($dna) {
    
    return $dna =~ tr/ACGT/UGCA/r;
}

1;
