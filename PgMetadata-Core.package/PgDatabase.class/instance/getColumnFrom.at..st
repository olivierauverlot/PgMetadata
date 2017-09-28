accessing
getColumnFrom: aTableOID at: aColumnNum
	^self getColumns detect: [ :column | column owner = aTableOID and: [ column num = aColumnNum ] ]