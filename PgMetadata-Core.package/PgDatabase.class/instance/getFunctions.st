accessing
getFunctions
	^objects select: [ :o | o isSqlFunction ]