action
extract
	| regex ownertable |
	self database getTables do: [ :table |
		| constraint |
		regex := '\{(.*)\}' asRegex.
		(self runSQLWith: { table oid }) do: [ :result | 
			"create the constraint instance"
			ownertable := self database tableReferenceOf: (result atName: #referenced_table).
			constraint := (constraintClasses at: (result atName: #contype)) 
				oid: nil 
				name: (result atName: #constraint_name) 
				owner: ownertable
				namespace: (self database schemaReferenceOf: (result atName: #namespace_oid)).
			"add the column reference"
			(result atName: #conkey) do: [ :num | 
				constraint addColumn: (self database columnFrom: ownertable at: num)
			].
		
			self database addObject: constraint.
		]
	]