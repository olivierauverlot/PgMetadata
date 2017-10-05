parameters
sqlRequest
	^'SELECT
	connamespace as namespace_oid,
	contype,
	conname as constraint_name,
	t.oid as constrained_table,
	conkey as num_constrained_columns,
	t2.oid as referenced_table,
	c.confkey as num_referenced_columns
FROM pg_constraint c
	LEFT JOIN pg_class t  ON c.conrelid  = t.oid
	LEFT JOIN pg_class t2 ON c.confrelid = t2.oid
WHERE	t.oid = {1}
' 