action
extract
	| ownertable referencedTable |
	self database getTables do: [ :table |
		| constraint |
		(self runSQLWith: { table oid }) do: [ :result | 
			"create the constraint instance"
			ownertable := self database tableReferenceOf: (result atName: #constrained_table).
			constraint := (constraintClasses at: (result atName: #contype)) 
				oid: nil 
				name: (result atName: #constraint_name) 
				owner: ownertable
				namespace: (self database schemaReferenceOf: (result atName: #namespace_oid)).
			"add the constrained column references"
			(result atName: #num_constrained_columns) do: [ :num | 
				constraint addConstrainedColumn: (ownertable columnAt: num).
			].
		
			"add the referenced column references"
			(result atName: #num_referenced_columns) ifNotNil: [ 
				(result atName: #num_referenced_columns) do: [ :num |
					referencedTable := self database tableReferenceOf: (result atName: #referenced_table). 
					constraint addReferencedColumn: (referencedTable columnAt: num).
				]
			].
			
			"add the constraint to the model"
			self database addObject: constraint.
		]
	]