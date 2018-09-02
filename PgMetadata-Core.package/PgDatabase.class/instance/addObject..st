action
addObject: anObject
	self assert: anObject owner isNotNil.
	objects add: anObject.
	^anObject