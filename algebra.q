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