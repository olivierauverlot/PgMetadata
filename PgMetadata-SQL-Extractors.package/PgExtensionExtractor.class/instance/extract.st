action
extract
	self runSQL do: [ :extension | 
		self database addObject: (SqlExtension oid: (extension atName: #oid) name: (extension atName: #extname) owner: self database) 
	].