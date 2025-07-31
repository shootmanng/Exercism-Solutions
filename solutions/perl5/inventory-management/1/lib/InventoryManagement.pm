package InventoryManagement;

use v5.40;

sub create_inventory ($items) {

    my %inventory;
    
    foreach my $key ($items -> @*) {
        if (exists $inventory{$key}) {
            $inventory{$key} += 1;
        } else {$inventory{$key} = 1;}
    }
    
    return \%inventory;
}

sub add_items {
    # for some reason using prototypes add_items($inventory,$items) causes odd
    # behavior, so the format was changed
    my ($inventory, $items) = @_;
    foreach my $key ($items -> @*) {
        if (exists $inventory -> {$key}) {
            $inventory -> {$key} += 1;
        } else {$inventory -> {$key} = 1}
    }
    return $inventory;
}

sub remove_items {
    my ($inventory, $items) = @_;
    foreach my $key ($items -> @*) {
        if (exists $inventory -> {$key} && $inventory -> {$key} > 0) {
            $inventory -> {$key} -= 1;
        }
    }
    return $inventory;
}

sub delete_item {
    my ($inventory, $item) = @_;
    delete $inventory -> {$item};
    return $inventory;
}

1;
