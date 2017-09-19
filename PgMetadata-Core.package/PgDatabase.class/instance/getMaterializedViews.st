accessing
getMaterializedViews
	^objects select: [ :o | o isSqlMaterializedView ]