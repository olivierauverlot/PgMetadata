action
extractArgumentsTypesFrom: func
	^ ((func atName: #proallargtypes)
		ifNil: [ ((func atName: #proargtypes) substrings: ' ') ]
		ifNotNil: [ ((func atName: #proallargtypes) allButFirst allButLast
				substrings: ',') ]) collect: [ :oid | self getAllDatatypes detect: [ :d | d oid = oid asInteger ] ]