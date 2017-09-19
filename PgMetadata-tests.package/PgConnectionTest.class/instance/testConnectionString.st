tests
testConnectionString
	| connection str |
	connection := PgConnection hostname: 'localhost' port: 5432 database: 'db' user: 'john' password: 'doo'.
	str := connection getConnectionString.
	
	self assert: (str = 'postgresV2://localhost:5432/db?user=john&password=doo')