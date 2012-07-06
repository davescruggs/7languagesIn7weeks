futureResult := URL clone with("http://www.msn.com") 
futureResult @fetch
writeln("I'll do something now while the URL fetch goes on in the background")
writeln("This will block until the result is available")
writeln("fetched ", futureResult size, " bytes")