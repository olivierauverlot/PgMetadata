action
extract
"	self runSQL
		do: [ :reference | 
			| f t |
			f := self database getTables select: [ :table | table oid = (reference atName: #inhrelid) asInteger ].
			t := self database getTables select: [ :table | table oid = (reference atName: #inhparent) asInteger ].
			self database addObject: (SqlInheritanceReference owner: self database from: f to: t) ]"
	self runSQL
		do: [ :reference | 
			| from |
			from := self database getTables detect: [ :table | table oid = (reference atName: #inhrelid) asInteger ].
			from addParent: (self database getTables detect: [ :table | table oid = (reference atName: #inhparent) asInteger ])
		]