$[(0 1 2;0 2 1;1 0 2;1 2 0;2 0 1;2 1 0) ~ .math.st.perm0[3];0N!".math.st.perm0 case 1 PASSED";'".math.st.perm0 case 1 FAILED"];
$[(0 1;0 2;0 3;0 4;1 0;1 2;1 3;1 4;2 0;2 1;2 3;2 4;3 0;3 1;3 2;3 4;4 0;4 1;4 2;4 3) ~ .math.st.perm[5;2];0N!".math.st.perm case 1 PASSED";'".math.st.perm case 1 FAILED"];
$[(0 1;0 2;0 3;0 4;1 2;1 3;1 4;2 3;2 4;3 4) ~ .math.st.comb[5;2];0N!".math.st.comb case 1 PASSED";'".math.st.comb case 1 FAILED"];
$[(`$();enlist`b;enlist`a;`a`b) ~ .math.st.subsets`a`b;0N!".math.st.subsets case 1 PASSED";'".math.st.subsets case 1 FAILED"];

$[1 1 2 2 3 4 4 5 6 7.6 10 ~ .math.st.wquantile[reverse 1+til 10; 0.1*til 11;1+til 10];0N!".math.st.wquantile case 1 PASSED";'".math.st.wquantile case 1 FAILED"];

$[enlist[9]~.math.st.mode 1 1 2 2 5 5 9 9 9 8 8 7;0N!".math.st.mode case 1 (univariate) PASSED";'".math.st.mode case 1 (univariate) FAILED"];
$[3 4~.math.st.mode 1 1 1 2 2 2 3 3 3 3 4 4 4 4 8 8;0N!".math.st.mode case 2 (bivariate) PASSED";'".math.st.mode case 2 (bivariate) FAILED"];
$[`a`b`c~.math.st.mode (12#`d`e`f),(15#`a`b`c);0N!".math.st.mode case 3 (multivariate) PASSED";'".math.st.mode case 3 (multivariate) FAILED"];


$[not all {
    ((1!flip `instrument`2019.01.01_amount`2019.01.02_amount!(`EURUSD`USDJPY;30 30;0N 90))
        ~.math.st.pivot[x;enlist`instrument;`date;enlist[`amount]!enlist sum];
    (1!flip`instrument`2019.01.01_spread`2019.01.02_spread!(`EURUSD`USDJPY;0.015 0.03;0n 0.045))
        ~.math.st.pivot[x;enlist`instrument;`date;enlist[`spread]!enlist avg];
    (2!flip`instrument`client`2019.01.01_spread`2019.01.02_spread!(`EURUSD`EURUSD`USDJPY`USDJPY;`clientA`clientB`clientA`clientB;0.01 0.02 0.03 0n;0n 0n 0.05 0.04))
        ~.math.st.pivot[x;`instrument`client;`date;enlist[`spread]!enlist avg];
    (2!flip`instrument`client`2019.01.01_amount`2019.01.01_spread`2019.01.02_amount`2019.01.02_spread
            !(`EURUSD`EURUSD`USDJPY`USDJPY;`clientA`clientB`clientA`clientB;10 20 30 0N;0.01 0.02 0.03 0n;0N 0N 50 40;0n 0n 0.05 0.04))
        ~.math.st.pivot[x;`instrument`client;`date;`amount`spread!(sum;avg)])}
            flip (`instrument`date`client`amount`spread)!(`EURUSD`EURUSD`USDJPY`USDJPY`USDJPY;2019.01.01 2019.01.01 2019.01.01 2019.01.02 2019.01.02;5#`clientA`clientB;10*1+til 5;0.01*1+til 5)
 ;'"[AssertionError] .math.st.pivot case 1 FAILED"
 ;0N!".math.st.pivot case 1 PASSED"];