action
extract
	self runSQL do: [ :schema | 
		self database addObject: (SqlNamespace oid: (schema atName: #oid) name: (schema atName: #nspname) owner: self database) 
	].