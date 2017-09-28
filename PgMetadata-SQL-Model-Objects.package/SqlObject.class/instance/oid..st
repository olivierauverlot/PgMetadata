accessing
oid: anObject
	anObject 
		ifNil: [ oid := nil ] 
		ifNotNil: [ oid := anObject asInteger ]
	