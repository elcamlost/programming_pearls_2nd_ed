#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use autodie;
use v5.18;

use FILE_CONFIGURATION;

open(my $input_file, '<', "./input_file.txt");

#initialize vector
my $sorting_numbers = '';
vec($sorting_numbers, FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT - 1, 1) = 0;

#"sort" numbers
while(<$input_file>) {
  # remove newlines
  chomp;
  vec($sorting_numbers, $_, 1) = 1;
}

close($input_file);
open(my $output_file, '>', "./output_file.txt");

#print sorted numbers
for(my $bitVectorIndex = 1; $bitVectorIndex <= FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT; $bitVectorIndex ++) {
  if(vec($sorting_numbers, $bitVectorIndex, 1) == 1) {
    say $output_file $bitVectorIndex;
  }
}

close($output_file);
