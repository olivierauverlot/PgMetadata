parameters
sqlRequest
	^'SELECT 
	oid,
	attrelid,
	attnum,
	attname,
	pg_type.oid as type_oid,
	pg_type.typname,
	attlen,
	attndims,
	attnotnull,
	atthasdef
FROM pg_attribute,pg_type
WHERE
	atttypid = pg_type.oid
	AND attnum > 0
	AND attrelid = {1}'