action
extract
	self database getTables do: [ :table |
		(self runSQLWith: { table oid }) do: [ :result | 
			
			"result inspect.
			Halt now."
		]
	]