parameters
sqlRequest
	^'SELECT 
	pg_proc.oid,
	proname,
	pronamespace,
	pg_namespace.nspname as pronamespacename,
	proargnames,
	proargtypes,
	proallargtypes,
	prolang,
	pg_language.lanname as prolangname,
	prorettype,
	pg_type.typname as prorettypename,
	prosrc,
	proisagg
FROM 	pg_proc,pg_type,pg_language,pg_namespace
WHERE 
	prorettype = pg_type.oid
AND	 prolang = pg_language.oid 
AND	 pronamespace = pg_namespace.oid
AND 	pronamespace IN (
	SELECT oid
	FROM pg_namespace
	WHERE nspname NOT IN
	(''pg_toast'',''pg_temp_1'',''pg_toast_temp_1'',''pg_catalog'',''information_schema''))'