Dude := Object clone
Dude newSlot("name", "")
Dude newSlot("age", 0)
Dude description := method(name .. " (" .. age asHex .. ")")

tobey := Dude clone setName("Tobey!") setAge(19)
olle := Dude clone setName("Olle") setAge(33)
luisa := Dude clone setName("Luisa Carbonelli di L") setAge(33)
quag := Dude clone setName("Jonathan Wright") setAge(25)

dudes := list(tobey, olle, luisa, quag)
dudes foreach(dude, writeln(" ", dude name))
olderDudes := dudes select(dude, dude age > 25)
"======= Older Dudes ==========" println
olderDudes foreach(dude, writeln(" ", dude description))
"============ list stuff ===========" println
dudes first description println
dudes second description println