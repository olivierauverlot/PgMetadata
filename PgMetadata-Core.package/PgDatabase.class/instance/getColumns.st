accessing
getColumns
	^objects select: [ :o | o isSqlColumn ]