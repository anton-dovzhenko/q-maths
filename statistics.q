/////////////////////////////
///// Q-statistics package


// Returns factorial. For x > 20 returns 0W to avoid wrong output due to integer overflow issue
// @x [`int or `long]
.math.st.fact: {$[x>20;0W;prd 1+til x]};

// Returns list of all possible x-length permutations of integers from 0 to x-1
// @n [`int or `long] - permutation length
// Example: .math.st.perm0[3] returns (0 1 2;0 2 1;1 0 2;1 2 0;2 0 1;2 1 0)
.math.st.perm0: {[n] (n-1){raze y,/:'x except/:y}[til n]/til n};


// Returns list of all possible k-length permutations of integers from 0 to x-1
// @n [`int or `long] - number of elements in set
// @k [`int or `long] - permutation length
// Example: .math.st.perm[5;2] returns (0 1;0 2;0 3;0 4;1 0;1 2;1 3;1 4;2 0;2 1;2 3;2 4;3 0;3 1;3 2;3 4;4 0;4 1;4 2;4 3)
.math.st.perm: {[n;k] {[x;y] x where (count each distinct each x)=count each x: y cross x} over k#enlist til n};


// Returns list of all possible k-length combinations of integers from 0 to x-1
// @n [`int or `long] - number of elements in set
// @k [`int or `long] - combination length
// Example: .math.st.comb[5;2] returns (0 1;0 2;0 3;0 4;1 2;1 3;1 4;2 3;2 4;3 4)
// FIXME: use more efficient algorithm to generate choices
.math.st.comb: {[n;k] distinct asc each .math.st.perm[n;k]};


// Returns all subsets of input list including empty set.
// @x [()] - arbitrary list of distinct elements
// Example: .math.st.subsets `a`b returns (`$();enlist`b;enlist`a;`a`b)
.math.st.subsets: {c: count x;x where each (neg c)#'(c#0b),/:`boolean$2 vs/: til `long$2 xexp c};


// Returns amount of chooses of n from k
// @n - n
// @k - k
// Example: .math.st.cnk[5;3] returns 10
.math.st.cnk: {[n;k] `long$prd(1+til n)%(1+til k),1+til n-k};


// Returns distribution's standardized y^{th} moment
// @x [`number$()] - distribution
// @y [`int] - distribution moment
.math.st.stdmom: {avg ((x-avg x)%dev x) xexp y};


// Returns distribution's skewness
// @x [`number$()] - distribution
.math.st.skewness: .math.st.stdmom[;3];


// Returns distribution's kurtosis.
// Not adjusted by -3, i.e. .math.st.kurtosis of normal distribution N(0,1) is 3.
// @x [`number$()] - distribution
.math.st.kurtosis: .math.st.stdmom[;4];


// Returns mode
// @x [()] - arbitrary list
// Example: .math.st.mode[9 9 9 3 3 2 1 1] returns enlist 9
.math.st.mode: {where x=max x:count each group x};


// Returns quantiles
// @x [`numeric()] - numeric values
// @p [`float$()] - probabilities
// Example: .math.st.quantile[8 0 2 3 0 9 2 9 6 5;0 0.25 0.5 0.75 1] returns 0 2 4 7.5 9
.math.st.quantile: {[x;p]
    x: asc x;
    step: (1%-1+count x);
    leftXi: `int$(step xbar p)%step;
    x[leftXi]+0f^((p mod step)%step)*x[leftXi+1]-x[leftXi]
 };

// Returns weighted quantiles.
// TO avoid ambiguity, weights list @w must be integers and its sum should be within long range.
// @x [`numeric()] - numeric values
// @p [`float$()] - probabilities
// @w [`int$()] - weights
// Example: .math.st.quantile[8 0 2 3 0 9 2 9 6 5;0 0.25 0.5 0.75 1] returns 0 2 4 7.5 9
.math.st.wquantile: {[x;p;w]
    i: iasc x;
    x: x@i;
    w: w@i;
    w: -1+sums `long$w;
    step: 1%last w;
    leftXi: `int$(step xbar p)%step;
    xl: x@w binr leftXi;
    xr: x@w binr leftXi+1;
    xl+0f^((p mod step)%step)*xr-xl
 };


// Returns Spearman correlation
// @x [`numeric()] - numeric list
// @y [`numeric()] - numeric list
// Example: .math.st.corspearman[1 2 3;6 3 4] returns -0.5
.math.st.corspearman: {rank[x] cor rank y};


// Returns Kendall correlation
// @x [`numeric()] - numeric list
// @y [`numeric()] - numeric list
// Example: .math.st.corkendall[1 2 3;6 3 4] returns -0.33
.math.st.corkendall: {(2%c*c-1) * sum (signum raze (til c)_'x-/:\:x) * signum raze (til c:count y)_'y-/:\:y};


// Returns correlation matrix (Pearson)
// @n [`$()] - list of series' names
// @v [`$number] - list of series' values
// Example: .math.st.corrm[`n1`n2`n3;(1 2 3;4 5 7; 9 6 4)]
// returns flip `name`n1`n2`n3!(`n1`n2`n3;1 0.98 -0.99;0.98 1 -0.95;-0.99 -0.95 1)
// numbers are rounded to second digit after decimal point
.math.st.corrm: {[n;v]
    N: count n;
    c: .math.st.perm[N;2];
    C: c!(cor') . v@(flip c) 0 1;
    C,: (reverse each key C)!value C;
    C,: (2#'enlist each til N)!N#1f;
    flip (`name,n) ! enlist[n], N cut C {x cross x}til N
 };


// @t [flip] - table to pivot
// @rc [`$()] - row fields
// @cf [`symbol] - column field
// @ff [dictionary] - fact fields
// Example: .math.st.pivot[
//     flip(`instrument`date`client`amount`spread)!
//        (`EURUSD`EURUSD`USDJPY`USDJPY`USDJPY;
//        2019.01.01 2019.01.01 2019.01.01 2019.01.02 2019.01.02;
//        5#`clientA`clientB;
//        10*1+til 5;
//        0.01*1+til 5);
//     enlist`instrument;`date;enlist[`amount]!enlist sum]
// returns 1!flip (`instrument`2019.01.01_amount`2019.01.02_amount!(`EURUSD`USDJPY;30 30;0N 90))
.math.st.pivot: {[t;rc;cf;ff]
    P: asc distinct t cf;
    Pcol: `$string[P] cross "_",/:string key ff;
    t: ?[t;();rc!rc;key[ff]!{({[x;y;z] z each y@group x}[;;z];x;y)}[cf]'[key ff;value ff]];
    t: ![t;();0b; Pcol! raze {((';@);x;$[-11h=type y;enlist;::] y)}'[key ff]'[P] ];
    ![t;();0b;key ff]
 };


// Generates sample from Normal distribution N(@m, @sd^2)of size @n using Box-Muller transform
// @n [`int]  - number of observations
// @m [`float] - mean
// @sd [`float] - standard deviation
// Example: .math.st.rnorm[10;0;1] returns sample of size ten of N(0, 1)
.math.st.rnorm: {[n;m;sd]
    u1: n?1f;
    u2: n?1f;
    m + sd * sqrt[-2*log u1] * cos 2*u2*.math.c.pi
 };
