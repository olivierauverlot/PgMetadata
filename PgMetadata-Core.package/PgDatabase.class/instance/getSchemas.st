accessing
getSchemas
	^objects select: [ :o | o isSqlNamespace ]