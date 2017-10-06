# PgMetadata
Extracts the PostgreSQL metadata and build an SQL Model (In progress).

## How to install

```
Metacello new
    baseline: 'PgMetadata';
    repository: 'github://olivierauverlot/PgMetadata';
    load
```

## How to use PgMetadata

The class PgMetadata returns an instance of PgDatabase that describes the SQL schema. 

    | metadata sqlObjects |
    metadata := PgMetadata database: 'mydb' connection: (
	PgConnection
		hostname: 'localhost'
		port: 5432
		database: 'dbname'
		user: 'username'
		password: 'password'
    ).
    pgDB := metadata extractMetadata.
    sqlObjects := pgDB objects
