accessing
getSequences
	^objects select: [ :o | o isSqlSequence ]