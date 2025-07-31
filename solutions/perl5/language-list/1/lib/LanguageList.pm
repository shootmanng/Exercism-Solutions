package LanguageList;

use v5.40;

our @Languages;

sub add_language ($language) {
    return push(@Languages,$language);
}

sub remove_language () {
    return pop(@Languages);
}

sub first_language () {
    return $Languages[0];
}

sub last_language () {
    return $Languages[-1];
}

sub get_languages (@elements) {
    my @new = ();
    foreach my $i (@elements) {
        #-1 needed because testing was done with e.g. "get first language", so get_language(1)
        #should get the first element in the array
        push(@new,$Languages[$i-1]);
    }
    return @new;
}

sub has_language ($language) {
    foreach my $i (@Languages) {
        #eq is for string matching, maybe think about catching errors if its not a string?
        if ($i eq $language) {
        return 1;
        }
    }
    return 0;
}

1;
