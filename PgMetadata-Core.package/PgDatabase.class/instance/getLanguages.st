accessing
getLanguages
	^objects select: [ :o | o isSqlLanguage ]