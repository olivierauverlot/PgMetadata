comparing
= anObject
	^ self class == anObject class and: [ self oid = anObject oid and: [ self name = anObject name ] ]