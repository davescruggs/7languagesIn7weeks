
aliceFile = File.new("AliceInWonderland.txt", "r")
i = 1
myArray = aliceFile.readlines()
myArray.each {|l| if (/White Rabbit/.match(l)) then puts l end}