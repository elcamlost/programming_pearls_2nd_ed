## Original Problem statement from Column 1

*Input*: A file containing at most 27 000 integers in the range 1 .. 27 000
It is fatal error condition if any integer occurs twice in the input.
No other data is associated with the integer.

*Output*: A sorted list in increasing order of the input integers.

*Constraints*: At most (roughly) one thousand 16-bit words of storage are available in main memory; disk buffers in main memory and ample disk storage are available.

## Solution

Original solution uses bitmaps to represent all 27 000 numbers with N-th bit set to one if input file contains number N.

Perl is high level language and address single bit with perl is little tricky task. Fortunately, perl has [builtin vec function](http://perldoc.perl.org/functions/vec.html).
Unfortunately, documentation is not clear at all. Maybe i'm dumb, but i read it about an hour and use google before understood it usage.
Good articles about bit vectors are
* [Mastering Perl Chapter 16](http://chimera.labs.oreilly.com/books/1234000001527/ch16.html)
* http://www.devshed.com/c/a/perl/more-perl-bits/

To run program you need to run generate_numbers.pl first or provide file named input_file.txt some other way.

### Results
This task is about memory usage, so lets see how much memory our program used. I use Devel::Size module to track memory size of $sorting_numbers bitmap variable.

```
use Devel::Size qw(size);

#initialize vector
my $sorting_numbers = '';

#FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT is named constant for 27000
vec($sorting_numbers, FILE_CONFIGURATION::MAXIMUM_NUMBERS_COUNT - 1, 1) = 0;

say size($sorting_numbers);
```
Result is *3416 bytes*. But 27000 bits is exactly 3375 bytes. So what happens?

First, I read [Devel::Size documentation](https://metacpan.org/pod/Devel::Size#UNDERSTANDING-MEMORY-ALLOCATION) and find out valuable info about memory allocation in perl. A little memory overhead is totally normal. But 41 bytes?
So I wrote a little script to see size of one byte bit vector
```
use Devel::Size qw(size);
my $sorted_numbers = '';
vec($sorted_numbers, 8, 1) = 0;
my $size = Devel::Size::size($sorted_numbers);
say "$size";
```
I get 56 bytes (fifty six, Carl!). Conclusion is

* program works exactly as specified in original problem,
* perl is not most effective language to low level manipulations with memory

