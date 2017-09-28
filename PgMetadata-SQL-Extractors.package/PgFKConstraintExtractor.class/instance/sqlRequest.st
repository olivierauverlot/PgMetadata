parameters
sqlRequest
	^'SELECT
	connamespace as namespace_oid,
	conname as constraint_name,
	array_to_string(c.conkey, '','') AS num_constrained_columns,
	c.conrelid as referenced_table,
	array_to_string(c.confkey, '','') AS num_referenced_columns
FROM pg_constraint c
	LEFT JOIN pg_class t  ON c.conrelid  = t.oid
	LEFT JOIN pg_class t2 ON c.confrelid = t2.oid
WHERE 
	contype = ''f''
AND t.oid = {1}
' 