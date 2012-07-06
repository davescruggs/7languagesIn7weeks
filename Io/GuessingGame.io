GuessingGame := Object clone do (
	q := Random value(0,100) ceil
	guesses := 0
	lastGuess := nil
	
	guess := method(myGuess, 	
		distance := (q - myGuess) abs;
		if(distance == 0) then(
			"You found it!, My number was #{q}" interpolate println
		) elseif( distance < 2) then(
			"Burning up" println
		)elseif( distance < 5) then(
			"Hot" println
		) elseif( distance < 10) then(
			"Very warm" println
		)elseif( distance < 20 ) then(
			"Warm" println
		) elseif( lastGuess != nil) then(
			lastDistance := (q - lastGuess) abs;
			if(distance < lastDistance) then("Warmer" println) elseif(lastDistance < distance) then("Colder" println) else("Same" println)
		) else(
			"Cold" println
		)
		lastGuess = myGuess;
	)
)

myGame := GuessingGame clone

