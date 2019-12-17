////////////////////////////
///// Q-algebra package


// .math.a.lcm0 finds Least Common Multiple of two positive integers
// @x [`int or `long] - positive integer 1
// @y [`int or `long] - positive integer 2
// Example: .math.a.lcm0[6;9] returns 18
.math.a.lcm0: {last {d: x[2]-x[3]; $[0=d;;$[d<0; x[2]+:x[0]; x[3]+:x[1]]]; x} over (x;y;x;y)};


// .math.a.lcm0 finds Least Common Multiple list of positive integers
// @x [`int or `long$()] - list of positive integers
// Example: .math.a.lcm (4;5;9) returns 180
.math.a.lcm: {.math.a.lcm0 over x};


// .math.a.lcm0 finds Largest Common Divisor of two positive integers (by using LCM)
// @x [`int or `long] - positive integer 1
// @y [`int or `long] - positive integer 2
// Example: .math.a.gcd0[54;24] returns 6
.math.a.gcd0: {`long$x*y%.math.a.lcm0[x;y]};