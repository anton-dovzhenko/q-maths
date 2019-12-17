////////////////////////////
///// Q-statistics package

// Returns list of all permutations for integers from 0 to x-1
// @x [`int or `long] - permutation size
// Example: .math.st.perm[3] returns (0 1 2;0 2 1;1 0 2;1 2 0;2 0 1;2 1 0)
.math.st.perm: {(x-1){raze y,/:'x except/:y}[til x]/til x};