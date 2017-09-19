actions
extract
	self runSQL
		do: [ :schema | 
			self database
				addObject:
					(self sqlObjectClass 
						oid: (schema atName: #oid)
						name: (schema atName: #relname)
						owner: self database
						namespace: (self database schemaReferenceOf: (schema atName: #relnamespace) asInteger)) ]