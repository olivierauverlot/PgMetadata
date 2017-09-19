connection
connect
	connection := (GADriver fromConnectionString: (parameters getConnectionString)).
	connection connect.
	self postgresql: (PgPostgresql about: self).
	self extractObjects