##Problem Definition
If you take Problem 3 seriously, you will face the problem of generation K integers between 1 and 27,000 without
duplicates. The simplest approach uses the first K positive integers. This extreme data set won't alter the run time
of the bitmap method by much, but it might lead to a system sort that is much faster than on typical data. How could
you generate a file of K unique random integers between 1 and N in random order? Strive for a short program that is
also efficient.


##Problem Solution
I wrote such a program at first. [Here it is](https://github.com/elcamlost/programming_pearls_2nd_ed/blob/master/1_Cracking_the_Oyster/generate_numbers.pl).
```
time perl generate_numbers.pl

real    0m0.101s
user    0m0.083s
sys     0m0.006s
```
Program use perl rand builtin function. I think its effective enough for this project.