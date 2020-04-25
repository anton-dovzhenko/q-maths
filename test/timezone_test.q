$[(enlist 2020.04.24D13) ~ .math.tz.localToGmt[enlist `$"Asia/Singapore";enlist 2020.04.24D21]
    ;0N!".math.tz.localToGmt case 1 PASSED";'".math.tz.localToGmt case 1 FAILED"];
$[(enlist 2020.04.24D13) ~ .math.tz.localToGmt[`$"Asia/Singapore";enlist 2020.04.24D21]
    ;0N!".math.tz.localToGmt case 2 PASSED";'".math.tz.localToGmt case 2 FAILED"];
$[2020.04.24D13 2020.04.24D18 ~ .math.tz.localToGmt[`$("Asia/Singapore";"Europe/Kyiv");2#2020.04.24D21]
    ;0N!".math.tz.localToGmt case 3 PASSED";'".math.tz.localToGmt case 3 FAILED"];

$[(enlist 2020.04.25D05) ~ .math.tz.gmtToLocal[enlist `$"Asia/Singapore";enlist 2020.04.24D21]
    ;0N!".math.tz.gmtToLocal case 1 PASSED";'".math.tz.gmtToLocal case 1 FAILED"];
$[(enlist 2020.04.25D05) ~ .math.tz.gmtToLocal[`$"Asia/Singapore";enlist 2020.04.24D21]
    ;0N!".math.tz.gmtToLocal case 2 PASSED";'".math.tz.gmtToLocal case 2 FAILED"];
$[2020.04.25D05 2020.04.25D00 ~ .math.tz.gmtToLocal[`$("Asia/Singapore";"Europe/Kyiv");2#2020.04.24D21]
    ;0N!".math.tz.gmtToLocal case 3 PASSED";'".math.tz.gmtToLocal case 3 FAILED"];

$[2018.01.01 2019.01.01 2020.01.01~.math.tz.firstDayOfYear 2018.08.08 2019.09.09 2020.10.10
    ;0N!".math.tz.firstDayOfYear case 1 PASSED";'".math.tz.firstDayOfYear case 1 FAILED"];

$[52 0 0 0 0 0 1 1i~.math.tz.weekOfYear 2019.12.31 + til 8
    ;0N!".math.tz.weekOfYear case 1 PASSED";'".math.tz.weekOfYear case 1 FAILED"];