accessing
function
	^ self referencedObjects detect: [ :o | o isSqlTriggerFunction ]