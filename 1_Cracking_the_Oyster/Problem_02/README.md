##Problem Definition
One barrier between the code sketch and a complete FORTRAN program is the implementation of bitmaps. While this would be trivial in programming languages that support bitmaps as a primitive data type, FORTRAN programmers must usually implement them using other operations. Suppose tha the FORTRAN dialect provided bitwise logical operations on words (such as shifting, ANDing and ORing); how would you advise the programmers to implement bit vectors? How could you implement bitmaps if those logical operations were not available? How would you implement algorithm in COBOL? In Pascal?


##Problem Solution
I stuck to invent working approach to solve this problem without vec function. Left shift operator allows to shift only 64 bits (integer size on my machine). Of course, if we read input file 422 times ( int (27000 / 64) + 1 ), it helps and problem will be solved but its totally ineffective and, therefor, wrong solution.

I think, problem can be solved using pack function. But this approach need investigation.
