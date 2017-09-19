parameters
sqlRequest
	^'SELECT oid,nspname
	FROM pg_namespace
	WHERE nspname NOT IN
	(''pg_toast'',''pg_temp_1'',''pg_toast_temp_1'',''pg_catalog'',''information_schema'')'