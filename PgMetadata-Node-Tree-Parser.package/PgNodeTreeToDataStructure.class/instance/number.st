accessing
number
	^super number ==> [ :tokens |  
		Number readFrom: (tokens flattened reject: #isNil) readStream ]