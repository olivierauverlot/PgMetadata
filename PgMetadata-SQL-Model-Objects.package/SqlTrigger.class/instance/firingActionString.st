accessing
firingActionString
	self isInsert
		ifTrue: [ ^ 'INSERT' ].
		
	self isUpdate
		ifTrue: [ ^ 'UPDATE' ].
		
	self isDelete
		ifTrue: [ ^ 'DELETE' ].
		
	self isTruncate
		ifTrue: [ ^ 'TRUNCATE' ].
		
	self error: 'Should not reach this point. Error in the integer encoding #type.'