parameters
sqlRequest
	^ 'SELECT 
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
	{1}
FROM 	pg_proc,pg_type,pg_language,pg_namespace
WHERE 
	prorettype = pg_type.oid
AND	 prolang = pg_language.oid 
AND	 pronamespace = pg_namespace.oid'
		format:
			{(self database postgresql databaseMajorVersion >= 11
				ifTrue: [ 'prokind' ]
				ifFalse: [ 'proisagg as prokind' ])}
				
"It seems that proisagg as prokind not supported, as column description keep original name proisagg and skip alias !!!"