accessing
getTriggers
	^objects select: [ :o | o isSqlTrigger ]