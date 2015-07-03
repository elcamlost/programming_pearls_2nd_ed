##Problem Definition
Run-time efficiency was an important part of the design goal, and the resulting program was efficient enough. Implement the bitmap program on your system and measure its run time; how does it compare to the system sort on the same file?


##Problem Solution
I measured results with GNU time utility. For system sorting I used GNU sort utility with -h option.

I did ten measures for my program and for system sort.
Estimated Results.
My program
```
time perl sort_numbers.pl


real    0m0.090s
user    0m0.085s
sys     0m0.006s
```

GNU sort
```
time sort -h input_file.txt > output_file.txt

real    0m0.020s
user    0m0.018s
sys     0m0.003s
```

GNU sort wins.