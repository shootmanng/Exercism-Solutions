package ListOps;

use v5.40;

sub append ( $list1, $list2 ) {
    foreach(@$list2) {
        push @$list1, $_;
    }
    return $list1;
}

sub concat ($lists) {
    my $result = [];
    foreach (@$lists) {
        &append($result, $_);
    }
    return $result;
}

sub filter ( $func, $list ) {
    my $result = [];
    foreach(@$list) {
        if ($func -> ($_) != 0) {
            push @$result, $_;
        }
    }
    return $result;
}

sub length ($list) {
    my $i = 0;
    foreach(@$list) {
        $i++;
    }
    return $i;
}

sub map ( $func, $list ) {
    my $result = [];
    foreach(@$list) {
        push @$result, $func -> ($_)
    }
    return $result;
}

sub foldl ( $func, $initial, $list ) {
    unshift @$list, $initial;
    my $i = &length($list); 
    for(0..$i - 2) {
        @$list[$_ + 1] = $func -> (@$list[$_], @$list[$_ + 1]);
    }
    return @$list[$i - 1];
}

sub reverse ($list) {
    my $result = [];
    my $i = &length($list) - 1;
    while($i > -1) {
        push @$result, @$list[$i];
        $i--;
    }
    return $result;
}

sub foldr ( $func, $initial, $list ) {
    return &foldl($func, $initial, &reverse($list));
}


1;
