$[18 ~ .math.a.lcm 6 9; 0N!".math.a.lcm case 1 PASSED";'".math.a.lcm case 1 FAILED"];
$[180 ~ .math.a.lcm 4 5 9; 0N!".math.a.lcm case 2 PASSED";'".math.a.lcm case 2 FAILED"];

$[6 ~ .math.a.gcd 24 54; 0N!".math.a.gcd case 1 PASSED";'".math.a.gcd case 1 FAILED"];
$[3 ~ .math.a.gcd 24 54 9; 0N!".math.a.gcd case 2 PASSED";'".math.a.gcd case 2 FAILED"];

$[(2 3 61!2 2 1) ~ .math.a.getPrimeFactors 2196; 0N!".math.a.getPrimeFactors case 1 PASSED";'".math.a.getPrimeFactors case 1 FAILED"];

$[(20 56 92 128;23 68 113 158;26 80 134 188;29 92 155 218) ~ .math.a.mmu[(0 3 6 9;1 4 7 10;2 5 8 11);(0 4 8;1 5 9;2 6 10;3 7 11)]
    ; 0N!".math.a.mmu case 1 PASSED";'".math.a.mmu case 1 FAILED"];

$[() ~ .math.a.mdet (); 0N!".math.a.mdet case 1 PASSED";'".math.a.mdet case 1 FAILED"];
$[1 ~ .math.a.mdet 1; 0N!".math.a.mdet case 2 PASSED";'".math.a.mdet case 2 FAILED"];
$[-2 ~ .math.a.mdet (1 3;2 4); 0N!".math.a.mdet case 3 PASSED";'".math.a.mdet case 3 FAILED"];
$[129 ~ .math.a.mdet (7 1 3;8 9 4;6 2 5); 0N!".math.a.mdet case 4 PASSED";'".math.a.mdet case 4 FAILED"];


$[8 ~ .math.a.invmod[7;11]; 0N!".math.a.invmod case 1 PASSED"; '".math.a.invmod case 1 FAILED"];
$[15 ~ .math.a.invmod[15;16]; 0N!".math.a.invmod case 2 PASSED"; '".math.a.invmod case 2 FAILED"];
$[2 ~ .math.a.invmod[11;21]; 0N!".math.a.invmod case 3 PASSED"; '".math.a.invmod case 3 FAILED"];
$[6 ~ .math.a.invmod[21;25]; 0N!".math.a.invmod case 4 PASSED"; '".math.a.invmod case 4 FAILED"];

$[89469 92400 ~ .math.a.chineseRemainderSolver[11 16 21 25; 6 13 9 19];
    0N!".math.a.chineseRemainderSolver case 1 PASSED"; '".math.a.chineseRemainderSolver case 1 FAILED"];
$[933913 1687931 ~ .math.a.chineseRemainderSolver[67 7 59 61; 0 1 2 3];
    0N!".math.a.chineseRemainderSolver case 2 PASSED"; '".math.a.chineseRemainderSolver case 2 FAILED"];
$[908721 1687931 ~ .math.a.chineseRemainderSolver[67 7 59 61; 0 2 3 4];
    0N!".math.a.chineseRemainderSolver case 3 PASSED"; '".math.a.chineseRemainderSolver case 3 FAILED"];
$[426455 1687931 ~ .math.a.chineseRemainderSolver[67 7 59 61; 0 1 3 4];
    0N!".math.a.chineseRemainderSolver case 4 PASSED"; '".math.a.chineseRemainderSolver case 4 FAILED"];