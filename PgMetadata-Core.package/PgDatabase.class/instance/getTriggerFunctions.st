accessing
getTriggerFunctions
	^objects select: [ :o | o isSqlTriggerFunction ]