search
columnFrom: aTable at: aColumnNum
	^self getColumns detect: [ :column | column owner = aTable and: [ column num = aColumnNum ] ]