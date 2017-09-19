accessing
getDatatypes
	^objects select: [ :o | o isSqlDatatype ]