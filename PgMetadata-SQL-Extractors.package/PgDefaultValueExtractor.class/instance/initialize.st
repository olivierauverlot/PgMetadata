initialize-release
initialize
	super initialize.
	
	self pgdatatypes: (Dictionary new 
		at: 16 put: Boolean; 
		at: 20 put: Number; "int8"
		at: 21 put: Number; "int2"
		at: 23 put: Number; "int4"
		at: 26 put: Number; "oid"
		at: 700 put: Number; "float4"
		at: 701 put: Number; "float8"
		yourself).