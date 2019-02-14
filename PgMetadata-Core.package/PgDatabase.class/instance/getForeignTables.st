accessing
getForeignTables
	^objects select: [ :o | o isSqlForeignTable ]