///////////////////////////////////////////////
///// Q-bitwise and shift operations package

//////////////
// Preambule
// Q does not support integer bitwise operations.
// The most efficient way to implement them is loading shared object
// with corresponding C/C++ functions.
// However, Q implementation proposed below could be useful for non-critical parts,
// where loading 3rd-party modules is impractical


// .math.b.or performs bitwise OR on two integers
// @x [`int or `long] - integer one
// @y [`int or `long] - integer two
// Example: .math.b.or[5;7] returns 7
.math.b.or: {x: (2 vs x&y;2 vs x|y); 2 sv ((last[deltas count each x]#0b),x 0)|x 1};


// .math.b.and performs bitwise AND on two integers
// @x [`int or `long] - integer one
// @y [`int or `long] - integer two
// Example: .math.b.or[5;7] returns 5
.math.b.and: {x: (2 vs x&y;2 vs x|y); 2 sv ((last[deltas count each x]#0b),x 0)&x 1};


// .math.b.and performs bitwise XOR on two integers
// @x [`int or `long] - integer one
// @y [`int or `long] - integer two
// Example: .math.b.or[5;7] returns 2
.math.b.xor: {x: (2 vs x&y;2 vs x|y); 2 sv ((last[deltas count each x]#0b),x 0)<>x 1};


// .math.b.not performs bitwise complement
// @x [`int or `long] - integer
// Example: .math.b.not[7] returns -8
.math.b.not: {-1-x};


// .math.b.shiftLeft shifts bit pattern to the left
// @x [`int or `long] - integer
// @y [`int or `long] - number of positions to shift
// Example: .math.b.shiftLeft[7;1] returns 14
.math.b.shiftLeft: {2 sv (2 vs x), y#0b};


// .math.b.shiftRight shifts bit pattern to the right
// @x [`int or `long] - integer
// @y [`int or `long] - number of positions to shift
// Example: .math.b.shiftRight[7;1] returns 3
.math.b.shiftRight: {2 sv neg[y]_2 vs x};