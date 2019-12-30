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