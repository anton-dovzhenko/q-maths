/////////////////////////////
///// Q-statistics package


// Returns list of all permutations for integers from 0 to x-1
// @x [`int or `long] - permutation size
// Example: .math.st.perm[3] returns (0 1 2;0 2 1;1 0 2;1 2 0;2 0 1;2 1 0)
.math.st.perm: {(x-1){raze y,/:'x except/:y}[til x]/til x};


// Returns list of all <b>ordered</b> choices without replacement of K from N elements (aka N accommodate K)
// @n [`int or `long] - number of elements in set
// @k [`int or `long]- number of elements to accommodate
// Example: .math.st.accommodation[5;2] returns (0 1;0 2;0 3;0 4;1 0;1 2;1 3;1 4;2 0;2 1;2 3;2 4;3 0;3 1;3 2;3 4;4 0;4 1;4 2;4 3)
// FIXME: use more efficient algorithm to generate accommodations
.math.st.accommodation: {[n;k] {[x;y] x where (count each distinct each x)=count each x: y cross x} over k#enlist til n};


// Returns list of all <b>unordered</b> choices without replacement of K from N elements (aka N choose K)
// @n [`int or `long] - number of elements in set
// @k [`int or `long]- number of elements to choose
// Example: .math.st.choose[5;2] returns (0 1;0 2;0 3;0 4;1 2;1 3;1 4;2 3;2 4;3 4)
// FIXME: use more efficient algorithm to generate choices
.math.st.choose: {[n;k] distinct asc each .math.st.accommodation[n;k]};


// Returns correlation matrix (Pearson)
// @n [`$()] - list of series' names
// @v [`$number] - list of series' values
// Example: .math.st.corrm[`n1`n2`n3;(1 2 3;4 5 7; 9 6 4)]
// returns flip `name`n1`n2`n3!(`n1`n2`n3;1 0.98 -0.99;0.98 1 -0.95;-0.99 -0.95 1)
// numbers are rounded to second digit after decimal point
.math.st.corrm: {[n;v]
    N: count n;
    c: .math.st.choose[N;2];
    C: c!(cor') . v@(flip c) 0 1;
    C,: (reverse each key C)!value C;
    C,: (2#'enlist each til N)!N#1f;
    flip (`name,n) ! enlist[n], N cut C {x cross x}til N
 };