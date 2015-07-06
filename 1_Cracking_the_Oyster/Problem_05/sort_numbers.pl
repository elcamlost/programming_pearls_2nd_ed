#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use autodie;
use v5.18;

use lib '..';
use FILE_CONFIGURATION;

use constant HALF_BYTE => 4;

open(my $input_file, '<', "./input_file.txt");

#initialize vector
my $sorting_numbers = '';
vec($sorting_numbers, FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT - 1, HALF_BYTE) = 0;

#"sort" numbers
while(<$input_file>) {
  # remove newlines
  chomp;
  increment_num_count(\$sorting_numbers, $_);
}

close($input_file);
open(my $output_file, '>', "./output_file.txt");

#print sorted numbers
for(my $sorting_numbers_index = 1; $sorting_numbers_index <= FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT; $sorting_numbers_index ++) {
  my $count = get_num_count(\$sorting_numbers, $sorting_numbers_index);
  if($count > 0) {
    say $output_file $sorting_numbers_index for 1..$count;
  }
}

close($output_file);

sub increment_num_count { my ($sorting_numbers, $number) = @_;
  my $count = get_num_count($sorting_numbers, $number);
  $count ++;
  set_num_count($sorting_numbers, $number, $count);
}

sub get_num_count { my ($sorting_numbers, $number) = @_;
  my $start_bit = get_start_bit($number);
  return vec($$sorting_numbers, get_start_bit($number), HALF_BYTE);
}

sub set_num_count { my ($sorting_numbers, $number, $count) = @_;
  my $start_bit = get_start_bit($number);
  vec($$sorting_numbers, $start_bit, HALF_BYTE) = $count;
}

sub get_start_bit { my $number = shift;
  return $number * HALF_BYTE;
}

