accessing
table
	^ self referencedObjects detect: [ :o | o isSqlTable ]