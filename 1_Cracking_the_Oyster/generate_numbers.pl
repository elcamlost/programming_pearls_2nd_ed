#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use autodie;
use v5.18;

use constant MAXIMUM_NUMBERS_COUNT => 26999;

# set total numbers count between 10000 and 27000
my $total_numbers = 10000 + int(rand(MAXIMUM_NUMBERS_COUNT - 10000));

# to filter duplicates we'll use hash
my %numbers;

# print numbers;
for(my $i = 0; $i < $total_numbers; $i ++) {
  # add 1 to avoid zero value
  my $current_number = int(rand(MAXIMUM_NUMBERS_COUNT)) + 1;
  #print uniq number
  unless( exists($numbers{$current_number}) ) {
    say $current_number;
    $numbers{$current_number} = 1;
  }
}
