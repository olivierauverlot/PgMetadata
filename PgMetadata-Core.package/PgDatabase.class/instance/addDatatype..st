action
addDatatype: aDatatype
	^self getDatatypes 
		detect: [ :d | d oid = aDatatype oid ] 
		ifNone: [ ^self addObject: aDatatype ]