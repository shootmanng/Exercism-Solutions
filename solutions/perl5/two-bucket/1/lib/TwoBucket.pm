package TwoBucket;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<measure>;


my @state = (0,0);

sub transfer_to {

    my ($bkt,$amt1,$amt2,$max1,$max2) = @_;
    my $tamt;
    die "That isn't a bucket, bruh." if  (($bkt != 1) && ($bkt != 2));
        
    if ($bkt == 1) {

        if ($amt1 + $amt2 > $max1) {
        
            $tamt = $max1 - $amt1;
            $amt2 = $amt2 - $tamt;
        } else {
        
            $tamt = $amt2;
            $amt2 = 0;
        }
        
        return [$amt1 + $tamt, $amt2];
    } else {

        if ($amt1 + $amt2 > $max2) {
        
            $tamt = $max2 - $amt2;
            $amt1= $amt1 - $tamt;
        } else {
        
            $tamt = $amt1;
            $amt1 = 0;
        }
        
        return [$amt1, $amt2 + $tamt];
    }
    
    return "You fucked up somewhere if you returned this, king.";
}

sub spill {

    my ($bkt,$amt1,$amt2) = @_;

    die "That isn't a bucket, bruh." if  (($bkt != 1) && ($bkt != 2));

    if ($bkt == 1) {return [0,$amt2]}
    else {return [$amt1,0]}

    return "You fucked up somewhere if you returned this, king.";
}

sub fill {

    my ($bkt,$amt1,$amt2,$max1,$max2) = @_;

    die "That isn't a bucket, bruh." if  (($bkt != 1) && ($bkt != 2));

    if ($bkt == 1) {return [$max1,$amt2]}
    else {return [$amt1,$max2]}

    return "You fucked up somewhere if you returned this, king.";
}

sub measure  {

    my ( $bucket_1, $bucket_2, $goal, $start_bucket ) = @_;
    
    die "Goal larger than both buckets is impossible" if (($goal > $bucket_1) && ($goal > $bucket_2));
    die "Not a possible bucket" if (($start_bucket ne "one") && ($start_bucket ne "two"));
    
    my $mnum = 1;

    if ($start_bucket eq "one") {
        
        @state = ($bucket_1,0);
        my @init_state = @state;
        
        
        return { goalBucket => "one", moves => 1, otherBucket => 0 } if $bucket_1 == $goal;
        
        return { goalBucket => "two", moves => 2, otherBucket => $bucket_1 } if $bucket_2 == $goal;
        
        while (($state[0] != $goal) && ($state[1] != $goal)) {
    
            if ($mnum % 2 == 1) {

                @state = @{transfer_to(2,$state[0],$state[1],$bucket_1,$bucket_2)};
                $mnum++;
            } else {

                if ($state[1] == $bucket_2) {
                @state = @{spill(2,$state[0],$state[1])};
                } else {@state = @{fill(1,$state[0],$state[1],$bucket_1,$bucket_2)}}
                $mnum++;
            }        
            
            die "impossible" if (($init_state[0] == $state[0]) && ($init_state[1] == $state[1]));
        }

        return { goalBucket => "one", moves => $mnum, otherBucket => $state[1] } if $state[0] == $goal;

        return { goalBucket => "two", moves => $mnum, otherBucket => $state[0] } if $state[1] == $goal;

        return;
    } else {
    
        @state = (0,$bucket_2);
        my @init_state = @state;
        
        return { goalBucket => "two", moves => 1, otherBucket => 0 } if $bucket_2 == $goal;
        
        return { goalBucket => "one", moves => 2, otherBucket => $bucket_2 } if $bucket_1 == $goal;

    while (($state[0] != $goal) && ($state[1] != $goal)) {
    
            if ($mnum % 2 == 1) {

                @state = @{transfer_to(1,$state[0],$state[1],$bucket_1,$bucket_2)};
                $mnum++;
            } else {

                if ($state[0] == $bucket_1) {
                @state = @{spill(1,$state[0],$state[1])};
                } else {@state = @{fill(2,$state[0],$state[1],$bucket_1,$bucket_2)}}
                $mnum++;
            }        
            
            die "impossible" if (($init_state[0] == $state[0]) && ($init_state[1] == $state[1]));
        }

        return { goalBucket => "one", moves => $mnum, otherBucket => $state[1] } if $state[0] == $goal;

        return { goalBucket => "two", moves => $mnum, otherBucket => $state[0] } if $state[1] == $goal;

        return;
    
    }
}

1;
