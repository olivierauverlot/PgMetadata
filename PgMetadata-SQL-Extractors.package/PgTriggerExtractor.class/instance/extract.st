action
extract
	self runSQL do: [ :item |
		| trigger |
		trigger := (SqlTrigger oid: (item atName: #oid) name: (item atName: #triggername) owner: self database).
		trigger table: ((self database getTables) detect: [ :t | t oid = (item atName: #table_oid) asInteger ]).
		trigger function: ((self database getFunctions) detect: [ :f | f oid = (item atName: #function_oid) asInteger ] ifNone: [ nil ]).
		trigger type: (item atName: #tgtype) asInteger.
		self database addObject: trigger.
	]
