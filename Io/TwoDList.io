TwoDList := List clone do (
	
	dim := method(x, y, 
		self setSize(x); 
		for(i, 0, x-1, self atPut(i, list setSize(y));); 
		)
		
	set := method(x, y, value, 
		self at(x) atPut(y, value))	
		
	get := method(x, y, self at(x) at(y))	

	transpose := method(
		twoDReturn := TwoDList clone;
		x := self size; "x #{x}" interpolate println;
		y := self at(0) size;  "y #{y}" interpolate println;
		twoDReturn dim(y, x); 
		for(i, 0, y-1, for(j, 0, x-1, twoDReturn set(i,j, self get(j,i))))
		return twoDReturn;
	)
	
	dump := method(
		"=== #{self} ===" interpolate println;
		for(i, 0, self size - 1, 
			for(j, 0, self at(i) size - 1, "#{self get(i, j)} " interpolate print); "" println;
		)
	)
	
	rehydrate := method(filename, 
		file := File clone;
		file open(filename);
		self removeAll;
		lines := file readLines;
		for(i, 0, lines size -1, lines at(i) println; self append(doString(lines at(i))));
	)
	
	dehydrate := method(filename, 
		file := File clone;
		try(file remove(filename));
		file openForUpdating(filename);
		"debug dehydrate" println
		self dump
		self foreach(row, "row: #{row}" interpolate println; file write("#{row}\n" interpolate));
		"debug dehydrate 2" println
		self dump
		file flush;
		file close;
	)
	
)



twoList := TwoDList clone

twoList dim(2,3)

for(i, 0, 1, for(j, 0, 2, twoList set(i, j, i+j)))

twoList dump

twoListB := twoList transpose
"dumping twoList" println
twoList dump
"dumping twoListB" println
twoListB dump


twoListB dehydrate("twoListB.csv")
twoListC := TwoDList clone
twoListC rehydrate("twoListB.csv")
"======= twoListC ========" println
twoListC dump
