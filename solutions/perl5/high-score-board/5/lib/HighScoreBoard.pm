package HighScoreBoard;

use v5.40;

our %Scores;

sub set_player_scores (%new_scores) {
    %Scores = (%Scores, %new_scores);
    return;
}

sub get_player_score ($player) {
    return $Scores{$player};
}

sub increase_player_scores (%additional_scores) {
    while (my ($ key, $value) = each %additional_scores) {
        $Scores{$key} += $value;
    }
    return;
}

sub sort_players_by_name {
    # do this in one line:
    return sort keys %Scores;

    # Iteration 2 (Works):
    #my %players = %Scores;
    #my @k = keys %players;
    #@k = sort @k;
    #return @k;
    
    #Second attempt:
    #my %players = @_;
    #my @k = keys %players;
    #@k = sort @k;
    #
    # Issue: this sub takes no input, so @_ assigns nothing
    # need to access global %Scores

    # First Attempt: 
    #my @keys = keys @_;
    #print @keys;
    #@keys = sort @keys;
    #print @keys;
    #return @keys;
    #
    # Issue: keys command works on hashes, here I was giving it a list
    # need to make a hash out of the input first (%_ doesnt seem to work)
}

sub sort_players_by_score {
    # this needs to be reversed because sort goes from low to high
    # want high to low
    my @sorted_scores = reverse sort values %Scores;
    
    # this only works if all scores are different
    my %inverse_Scores = reverse %Scores;
    my @sorted_players = ();
    
    foreach (@sorted_scores) {
        push(@sorted_players, $inverse_Scores{$_}); 
    }

    return @sorted_players;
}

sub delete_player ($player) {
    delete $Scores{$player};
    return;
}

1;
