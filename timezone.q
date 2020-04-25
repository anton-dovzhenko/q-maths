////////////////////////////
///// Q-timezone

// Idea and logic are taken from here https://code.kx.com/q/kb/timezones/

// Load timezone conversion data from resources/tzinfo.csv
// BEFORE running cd to directory with resources or replace path to tzinfo.csv below with appropriate one
.math.tz.t: {
    data: ("SPJJ";enlist ",")0: x;
    data: update gmtOffset: `timespan$1000000000*gmtOffset from data;
    data: update dstOffset:`timespan$1000000000*dstOffset from data;
    data: update adjustment:gmtOffset+dstOffset from data;
    data: update localDateTime:gmtDateTime+adjustment from data;
    data: `gmtDateTime xasc data;
    data: update `g#timezoneID from data;
    data
 }`:resources/tzinfo.csv;


// .math.tz.gmtToLocal converts GMT time to time of @tz timezone
// @tz [`sym or `$()] - single timezone or list of timezones
// @z [`timestamp$()] - list of @tz timestamps
// Example: .math.tz.localToGmt[enlist `$"Asia/Singapore";enlist 2020.04.24D21] returns enlist 2020.04.24D13
.math.tz.gmtToLocal: {[tz;z] exec gmtDateTime+adjustment from aj[`timezoneID`gmtDateTime;([]timezoneID:tz; gmtDateTime:z); .math.tz.t]};


// .math.tz.gmtToLocal converts time of @tz timezone to GMT time
// @tz [`sym or `$()] - single timezone or list of timezones
// @z [`timestamp$()] - list of GMT timestamps
// Example: .math.tz.gmtToLocal[`$"Asia/Singapore";enlist 2020.04.24D21] returns enlist 2020.04.25D05
.math.tz.localToGmt: {[tz;z] exec localDateTime-adjustment from aj[`timezoneID`localDateTime;([]timezoneID:tz; localDateTime:z); .math.tz.t]};


// .math.tz.firstDayOfYear returns 1st Jan
// @x [`date or `date$()] - date or list of dates
// Example: .math.tz.firstDayOfYear 2018.08.08 2019.09.09 2020.10.10 returns 2018.01.01 2019.01.01 2020.01.01
.math.tz.firstDayOfYear: {"d"$12 xbar"m"$x};


// .math.tz.weekOfYear returns yearly week number starting from 0.
// Week starts on Monday.
// @x [`date or `date$()] - date or list of dates
// Example: .math.tz.weekOfYear 2019.12.31 + til 8 returns 52 0 0 0 0 0 1 1
.math.tz.weekOfYear: {(x-`week$.math.tz.firstDayOfYear x) div 7};