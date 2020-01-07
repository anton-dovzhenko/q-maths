# Q-maths

Library of mathematical functions for Q/KDB.

Original goal of the library is not to implement sophisticated mathematical algorithms and methods.
But to enrich default Q maths with functions broadly available in other languages (like Python)

Every file in the library corresponds to particular namespace, where functions from given maths area are consolidated

* .math.a is algebra namespace. Placed in algebra.q
* .math.b is bitwise operations namespace. Placed in bit.q
* .math.c is constants namespace. Placed in constants.q
* .math.st is statistics namespace. Placed in statistics.q (requires .math.c)

### kdb+ support
Tested on kdb 3.5+ versions.
Shakti support is planned as well (could require separate codebase though)