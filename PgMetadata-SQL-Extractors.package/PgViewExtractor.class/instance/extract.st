actions
extract
	self runSQL
		do: [ :schema | 
			self database
				addObject:
					(self sqlObjectClass 
						oid: ((schema atName: #oid) asInteger)
						name: (schema atName: #relname)
						owner: self database
						namespace: (self database schemaReferenceOf: (schema atName: #relnamespace) asInteger)
						definition: (schema atName: #definition)) ]