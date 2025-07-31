package KindergartenGarden;
use Data::Dumper;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants ( $diagram, $student ) {
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );

    my %names = (
        Alice => 0,
        Bob => 1,
        Charlie => 2,
        David => 3,
        Eve => 4,
        Fred => 5,
        Ginny => 6,
        Harriet => 7,
        Ileana => 8,
        Joseph => 9,
        Kincaid => 10,
        Larry => 11,
    );
    
    my @rows = split/\n/, $diagram;
    my @row1 = split//, $rows[0];
    my @row2 = split//, $rows[1];
    my $n = $names{$student};
    
    return [$plants{$row1[(2 * $n)]}, $plants{$row1[(2 * $n + 1)]}, $plants{$row2[(2 * $n)]}, $plants{$row2[(2 * $n + 1)]}];
}

1;
