fib := method(operand,
	if(operand < 1, 0, if(operand == 1, 1, fib(operand - 1) + fib(operand-2)))
	)


"1 " print
fib(1) println
"2 " print	
fib(2) println
"3 " print	
fib(3) println
"4 " print	
fib(4) println
"5 " print
fib(5) println
"6 " print
fib(6) println
"7 " print
fib(7) println
"8 " print
fib(8) println