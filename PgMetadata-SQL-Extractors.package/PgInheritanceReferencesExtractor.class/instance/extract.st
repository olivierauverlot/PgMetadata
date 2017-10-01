action
extract
	self runSQL
		do: [ :reference | 
			| child parent |
			"Who is the parent table ?"
			child := self database getTables detect: [ :table | table oid = (reference atName: #inhrelid) asInteger ].
			parent := (self database getTables detect: [ :table | table oid = (reference atName: #inhparent) asInteger ]).
			child addParent: parent.
		]