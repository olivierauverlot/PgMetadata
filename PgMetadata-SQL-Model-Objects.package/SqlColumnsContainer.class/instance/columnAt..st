action
columnAt: aColumnNum
	^self columns detect: [ :column | column num = aColumnNum ]