action
extractMetadata
	| db |
	db := PgDatabase name: 'appsi' connection: self connection.
	db connect.
	db close.
	^db