action
extract
	self database getSchemas do: [ :namespace |
		(self runSQLWith: { namespace name }) do: [ :result |
			| constrainedTable referencedTable |
			constrainedTable := self database getObjectWithOID:(result atName: #dependent_table_oid) asNumber.
			constrainedTable ifNotNil: [  
				referencedTable := self database getObjectWithOID: (result atName: #source_table_oid) asNumber.
				referencedTable ifNotNil: [ 
					((result atName: #column_idx) > 0) ifTrue: [  
					constrainedTable addReferencedObject: (referencedTable columnAt: (result atName: #column_idx)).
					]
				]
			]
		]
	]
	 
