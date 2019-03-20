accessing
whenString
	self isBefore
		ifTrue: [ ^ 'BEFORE' ].
	
	self isAfter
		ifTrue: [ ^ 'AFTER' ].
		
	self isInstead
		ifTrue: [ ^ 'INSTEAD' ].
		
	self error: 'Should not reach this point. Error in the integer encoding #type.'