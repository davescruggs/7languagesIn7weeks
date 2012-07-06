
myAvg := method(lst, 
	if(lst isNil, Exception raise("List cannot be nil"));
	if(lst size == 0, return 0);
	sum := 0;
	count := 0;
	for(i, 0, lst size - 1, 
		item := lst at(i) asNumber;
		item println;
		if(item isNil, 
			Exception raise("list items must be numbers"),
			sum = sum + item; 
			count = count + 1;
		)
	)
	return sum / count;
)

a := list(1,2,3,4,5,6,7)
"average of " print
a print
" is " print
myAvg(a) println

b := list(1,2,list(3,4),5,6)
"average of " print
b print
" is " print
myAvg(b) println