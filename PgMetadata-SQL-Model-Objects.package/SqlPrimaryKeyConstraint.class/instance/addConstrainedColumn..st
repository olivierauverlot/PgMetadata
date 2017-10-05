action
addConstrainedColumn: aColumn
	self constrainedColumns add: aColumn.
	aColumn isPK: true