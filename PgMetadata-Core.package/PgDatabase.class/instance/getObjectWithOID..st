accessing
getObjectWithOID: anOid
	^objects detect: [ :o | o oid = anOid ] ifNone: [ nil ]