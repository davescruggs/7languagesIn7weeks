Builder := Object clone
Builder depth := 0
Builder open := false
Builder forward := method(
	depth = depth + 1
	firstArg := true
	if (open, writeln(" >"))
	depth repeat("   " print)
	write("<", call message name)
	open = true
	call message arguments foreach(
		arg,
		content := self doMessage(arg);		
		if(content type == "Map" and firstArg, 
			content foreach(i, v, write(" ", i, "=\"", v, "\" "))
		)
		if(open, writeln( " >"); open = false) // close tag
		if(content type == "Sequence", depth repeat("   " print); "   " print; writeln(content))
		firstArg = false
	)
	depth repeat("   " print)
	writeln("</", call message name, ">")
	depth = depth - 1
)

OperatorTable addAssignOperator(":", "atPutNVP")
curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		r doMessage(arg)
		)
	r
)
Map atPutNVP := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), 
		call evalArgAt(1)
	);
)
pr := {"try this": "my value"}
pr println
println(pr type)

Builder ul(
	li("Lua"),
	li({"Author": "Steve Dekorte"}, "Io", "Language"),
	li("JavaScript")
	)