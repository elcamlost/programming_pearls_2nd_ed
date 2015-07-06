##Problem Definition
What would you recommend to the programmer if, instead of saying that each integer could appear at most once, he
told you that each integer could appear at most ten times? How would your solution change as a function of the amount
 of available storage?


##Problem Solution
We can use some straightforward and ugly methods. For example, we can handle ten different bitmaps foreach and set
n-th bit to 1 foreach repetition of the number n. But its ugly and requires ten times more memory than original
solution.

More elegant way to solve the problem is using more than one bit foreach number. Each number can appear at most ten
times. Ten is 1100 in binary notation, so we need 4 bits (half-byte) to store number of repetitions. And solution can be easily achieved with vec function.

We need to modify generate_numbers.pl script to allow duplicate numbers. Also we need to modify maximum numbers can be generated. I decided to generate between 27 000 and 5 * 27 000 numbers, all of
 them between 1 and 27000.