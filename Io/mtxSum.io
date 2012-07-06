myMtx :=list(list(1,2,3),list(4,5,6),list(7,8,9))

mtxAdd := method(mtx, 
		count := 0;
		sum := 0;
				
		for(i, 0, mtx size - 1, 1, 
			row := mtx at(i);
			for(j, 0, row size - 1, 1, 
				sum = sum + (row at(j));
			)
		)
		return sum
	)

mtxAdd2 := method(mtx,
				sum := 0;
				vec := mtx flatten;
				for(i, 0, vec size - 1, sum = sum + vec at(i))
			)

mtxAdd(myMtx) println	
mtxAdd2(myMtx) println