search
tableReferenceOf: aTableOid
	^self getTables detect: [ :table | table oid = aTableOid asInteger ]