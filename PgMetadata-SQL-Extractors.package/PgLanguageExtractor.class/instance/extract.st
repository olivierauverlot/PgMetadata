action
extract
	self runSQL do: [ :language | 
		self database addObject: (SqlLanguage oid: (language atName: #oid) name: (language atName: #lanname) owner: self database) 
	]