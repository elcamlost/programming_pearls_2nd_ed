#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use autodie;
use v5.18;

use constant MAXIMUM_VECTOR_SIZE => 1000 * 16;

open(my $input_file, '<', "../input_file.txt");

#initialize vector
my $sorting_numbers = '';
vec($sorting_numbers, MAXIMUM_VECTOR_SIZE - 1, 1) = 0;

#"sort" numbers, number must be lower or equal to MAXIMUM_VECTOR_SIZE
while(<$input_file>) {
  # remove newlines
  chomp;
  if($_ <= MAXIMUM_VECTOR_SIZE) {
    vec($sorting_numbers, $_, 1) = 1;
  }
}

open(my $output_file, '>', "../output_file.txt");

#print sorted numbers
for(my $sorting_vector_index = 1; $sorting_vector_index <= MAXIMUM_VECTOR_SIZE; $sorting_vector_index ++) {
  if(vec($sorting_numbers, $sorting_vector_index, 1) == 1) {
    say $output_file $sorting_vector_index;
  }
}

#reinitialize
$sorting_numbers = '';
vec($sorting_numbers, MAXIMUM_VECTOR_SIZE - 1, 1) = 0;
seek($input_file, 0, 0);

#"sort" numbers again, now number must be bigger than MAXIMUM_VECTOR_SIZE
while(<$input_file>) {
  # remove newlines
  chomp;
  if($_ > MAXIMUM_VECTOR_SIZE) {
    vec($sorting_numbers, $_ - MAXIMUM_VECTOR_SIZE, 1) = 1;
  }
}
close $input_file;

#print sorted numbers
for(my $sorting_vector_index = 1; $sorting_vector_index <= MAXIMUM_VECTOR_SIZE; $sorting_vector_index ++) {
  if(vec($sorting_numbers, $sorting_vector_index, 1) == 1) {
    say $output_file (MAXIMUM_VECTOR_SIZE + $sorting_vector_index);
  }
}

close($output_file);
