sql
sqlRequest	
	^'SELECT oid,relname,relnamespace 
FROM pg_class
WHERE 
	relkind = ''{1}''
AND relnamespace IN (
	SELECT oid
	FROM pg_namespace
	WHERE nspname NOT IN
	(''pg_toast'',''pg_temp_1'',''pg_toast_temp_1'',''pg_catalog'',''information_schema'')
)' format: { self relkind }