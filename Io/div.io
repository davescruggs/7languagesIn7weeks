Number setSlot("coreDivision", Number getSlot("/"));

Number setSlot(
	"/",
	method( denominator, 
		if( denominator == 0 ) return( 0 ); 
		return( self coreDivision( denominator ) );
		)
	);

5/3 println
2/0 println