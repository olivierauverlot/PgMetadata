as yet unclassified
addUniqueStubObject: anObject 
	^ self objects "Stub objects have no name."
		detect: [ :object | object oid = anObject oid and: [ object name = anObject name ] ]
		ifNone: [ ^ self addStubObject: anObject ]