printing
printOn: aStream
	^aStream 
		nextPutAll: self className;
		nextPutAll: ' ';
		nextPutAll: self name.