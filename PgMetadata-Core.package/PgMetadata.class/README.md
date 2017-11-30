I'm the main class of PgStudio.

| metadata sqlObjects |
metadata := PgMetadata database: 'appsi' connection: (
	PgConnection
		hostname: 'localhost'
		port: 5432
		database: 'database'
		user: 'account'
		password: 'password'
).
sqlObjects := metadata extractMetadata.
sqlObjects inspect.

TODO
---------
* aggregate
* index