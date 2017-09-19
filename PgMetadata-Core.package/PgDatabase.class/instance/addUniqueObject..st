action
addUniqueObject: anObject
	^self objects 
		detect: [ :object |  object = anObject ] 
		ifNone: [ ^self addObject: anObject ]