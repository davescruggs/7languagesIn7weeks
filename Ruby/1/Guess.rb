randomNum = rand(10);
numFound = false;
until(numFound)
	puts "Guess what number I'm thinking of between 1 and 10";
	puts "shh! I'm thinking of #{randomNum}";
	trialNum = gets;
	trialNum = trialNum.to_i();
	if trialNum == randomNum
		puts "you guessed it! I was thinking of #{randomNum}!";
		numFound = true;
	else
		puts "you guessed #{trialNum}, but that's wrong. try again:"
	end
end