accessing
getColumnContainers
	^objects select: [ :o | o isSqlColumnsContainer ] 