#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use autodie;
use v5.18;

use FILE_CONFIGURATION;
# set total numbers count between MINIMUM_NUMBERS_COUNT and MAXIMUM_NUMBERS_COUNT
my $total_numbers = FILE_CONFIGURATION::MINIMUM_NUMBERS_COUNT + int(rand(FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT - FILE_CONFIGURATION::MINIMUM_NUMBERS_COUNT)) + 1;

open(my $input_file , ">", "input_file.txt");

# to filter duplicates we'll use hash
my %numbers;

# print numbers;
for(my $i = 0; $i < $total_numbers; $i ++) {
  # add 1 to avoid zero value
  my $current_number = generate_random_number();

  #print uniq number to file
  unless( exists($numbers{$current_number}) ) {
    say $input_file $current_number;
    $numbers{$current_number} = 1;
  }
}

close $input_file;

# generate random number between 1 and MAXIMUM_NUMBER_COUNT
sub generate_random_number {
  return 1 + int(rand(FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT));
}
