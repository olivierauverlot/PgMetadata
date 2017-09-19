accessing
getViews
	^objects select: [ :o | o isSqlView ]