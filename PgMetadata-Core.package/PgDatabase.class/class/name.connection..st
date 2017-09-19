initialize
name: aName connection: connectionParameters
	^ self new
		name: aName;
		parameters: connectionParameters;
		yourself