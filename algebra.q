////////////////////////////
///// Q-algebra package


// .math.a.lcm finds Least Common Multiple of list of positive integers
// @x [`int or `long$()] - list of positive integers
// Example: .math.a.lcm (4;5;9) returns 180
.math.a.lcm: {`long$prd {key[x] xexp value x} max .math.a.getPrimeFactors each x};


// .math.a.gcd finds Largest Common Divisor of list of positive integers (by using LCM)
// @x [`int or `long$()] - list of positive integers
// Example: .math.a.gcd (24;54;9) returns 3
.math.a.gcd: {
    `long$prd {key[x] xexp value x} ((inter/)key each x)#min x:.math.a.getPrimeFactors each x
 };


// Returns prime factorization of integer using trial division
// @x [`int or `long] - integer number to factorize
// Example: .math.a.getPrimeFactors[2196] returns 2 3 61!2 2 1
.math.a.getPrimeFactors: {
   F: ();
   while[0=x mod 2; F,:2; x%:2];
   f: 3;
   while[x>=f*f; $[0=x mod f; [F,:f; x%:f]; f+:2] ];
   if[not x=1; F,:`long$x];
   count each group F
 };


// Returns inverse modulo (brute-force)
// @x [`int or `long] - number
// @y [`int or `long] - modulo
// Example .math.a.getPrimeFactors[7;11] returns 8
.math.a.invmod: {{$[0=(-1+x*z) mod y;z;z+1]}[x mod y;y] over 1};


// @m - divisors
// @a - remainders
// Example .math.a.chineseRemainderSolver[3 4 5; 0 3 4] returns 39 60
.math.a.chineseRemainderSolver: {[m;a]
    N: prd m;
    Z: N div m;
    Y: .math.a.invmod ./:Z,'m;
    W: Y*Z;
    X: sum (W*a) mod N;
    (X mod N;N)
 };


// Multiplies matrices. Matrix is defined as list of column values.
// mmu operation is defined in Q, see https://code.kx.com/q/ref/mmu/,
// but it works only with floats.
// In Q matrix
// (0  1  2)
// (3  4  5)
// (6  7  8)
// (9 10 11)
// is defined as list of columns: (0 3 6 9;1 4 7 10;2 5 8 11)
// @x [numeric columnar matrix] - left matrix
// @y [numeric columnar matrix] - right matrix
// Example: .math.a.mmu[(0 3 6 9;1 4 7 10;2 5 8 11);(0 4 8;1 5 9;2 6 10;3 7 11)]
// returns (20 56 92 128;23 68 113 158;26 80 134 188;29 92 155 218)
.math.a.mmu: {flip(sum'')flip[x]*/:\:y};


// Returns matrix determinant. Matrix is defined as list of column values.
// Raw matrix definition is used for calculation.
// @x - matrix as list of columns
// Example: .math.a.mdet (7 1 3;8 9 4;6 2 5) returns 129
.math.a.mdet: {
    if[1>=count x;:x];
    {
        if[2=count x;:(x[0;0]*x[1;1])-x[0;1]*x[1;0]];
        sum ({x*count[x]#1 -1}x 0)*.z.s each {x@\:/:{(til x) except/:til x}count x 0} 1_x
     } flip x
 };