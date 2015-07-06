#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use autodie;
use v5.18;

use lib '..';
use FILE_CONFIGURATION;
# set total numbers count between MINIMUM_NUMBERS_COUNT and MAXIMUM_NUMBERS_COUNT
my $total_numbers = FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT  +  4 * int(rand(FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT))  +  1;

open(my $input_file , ">", "input_file.txt");

# print numbers;
for(my $i = 0; $i < $total_numbers; $i ++) {
  say $input_file generate_random_number();

}

close $input_file;

# generate random number between 1 and MAXIMUM_NUMBER_COUNT
sub generate_random_number {
  return 1 + int(rand(FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT));
}
