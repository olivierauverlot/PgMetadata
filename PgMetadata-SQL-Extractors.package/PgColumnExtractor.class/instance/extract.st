action
extract
	self database getTables do: [ :table |
		(self runSQLWith: { table oid }) do: [ :result | 
			| column dt |
			column := SqlColumn oid: nil name: (result atName: #attname) owner: table.
			column num: (result atName: 'attnum') asInteger.
			column length: (result atName: 'attlen') asInteger.
			column dimensions: (result atName: 'attndims') asInteger.
			column isNotNull: (result atName: 'attnotnull').
			column hasDefaultValue: (result atName: 'atthasdef').

			dt := SqlDatatype oid: (result atName: 'type_oid') name: (result atName: 'typname')  owner: (self database).
						
			column datatype: (self database addUniqueObject: dt).
			self database addObject: column. 
			table addColumn: column.
		]
	]