accessing
getNamespaces
	^objects select: [ :o | o isSqlNamespace ]