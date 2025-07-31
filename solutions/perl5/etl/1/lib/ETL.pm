package ETL;

use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<transform>;

sub transform {
    my ($data) = @_;
    my %hash = %{$data};
    my %result;
    
    foreach (keys %hash) {
        my $ref = $_;
        my @arr = @{$hash{$_}};
        foreach (@arr) {
            $result{lc($_)} = $ref;
        }
    }
    return \%result;
}

1;
