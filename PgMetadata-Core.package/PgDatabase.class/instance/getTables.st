accessing
getTables
	^objects select: [ :o | o isSqlTable ]