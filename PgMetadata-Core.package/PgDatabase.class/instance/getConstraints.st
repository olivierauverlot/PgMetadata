accessing
getConstraints
	^objects select: [ :o | o isSqlConstraint ]