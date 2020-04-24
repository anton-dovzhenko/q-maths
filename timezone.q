////////////////////////////
///// Q-timezone

// Idea and logic are taken from here https://code.kx.com/q/kb/timezones/

// Load timezone conversion data from resources/tzinfo.csv
// BEFORE running cd to directory with resources or replace path to tzinfo.csv below with appropriate one
.math.tz.t: ("SPJJ";enlist ",")0:`:resources/tzinfo.csv;
.math.tz.t: update gmtOffset: `timespan$1000000000*gmtOffset from .math.tz.t;
.math.tz.t: update dstOffset:`timespan$1000000000*dstOffset from .math.tz.t;
.math.tz.t: update adjustment:gmtOffset+dstOffset from .math.tz.t;
.math.tz.t: update localDateTime:gmtDateTime+adjustment from .math.tz.t;
.math.tz.t: `gmtDateTime xasc .math.tz.t;
.math.tz.t: update `g#timezoneID from .math.tz.t;

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
