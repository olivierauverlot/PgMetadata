action
extract
	| ownerTable ownerColumn |
	
	self database getTables do: [ :table |
		| default pharoclass |
		(self runSQLWith: { table oid }) do: [ :result |
			ownerTable := self database tableReferenceOf: (result atName: #table_oid).
			ownerColumn := ownerTable columnAt: (result atName: #num_column).
			
			default := SqlDefaultValue  
				oid: nil 
				name: ownerTable name ,'_', ownerColumn name 
				owner: ownerColumn.
			"
				if default value don't content references, we must convert the constant
				to the Pharo datatype (Integer, Boolean, Date, etc.).
			"
			"basic datatypes are converted to Pharo types"
			"pharoclass := self pgdatatypes at: (ownerColumn datatype oid) ifAbsent: [ nil ].
			pharoclass 
				ifNil: [ default content: (result atName: #content) ] 
				ifNotNil: [ default content: (pharoclass pgTypeConvert: (result atName: #content)) ]."
			
			default content: (result atName: #content).
			ownerColumn defaultValue: default.
			
			"add the constraint to the model"
			self database addObject: default.	
		] 
	]