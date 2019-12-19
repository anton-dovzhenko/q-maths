////////////////////////////
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