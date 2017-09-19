parameters
sqlRequest
	^'SELECT 
	oid,
	tgrelid as table_oid,
	tgname as triggername,
	tgfoid as function_oid,
	tgtype 
FROM pg_trigger
WHERE tgisinternal = false'