package NucleotideCount;

use v5.40;
use Data::Dumper;
use Exporter qw<import>;
our @EXPORT_OK = qw<count_nucleotides>;

sub count_nucleotides ($strand) {

    if ($strand =~ /[^ATCG]/) {die "Invalid nucleotide in strand"}
    
    my %nucleotides = (
        A => 0,
        T => 0,
        C => 0,
        G => 0,
    );
    my @strand = split//, $strand;
    
    foreach (@strand) {
        $nucleotides{$_} += 1;
    }
    
    return \%nucleotides;
}

1;
