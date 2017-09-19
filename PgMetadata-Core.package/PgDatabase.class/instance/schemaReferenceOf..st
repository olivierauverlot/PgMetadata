search
schemaReferenceOf: aSchemaOid
	^self getSchemas detect: [ :schema | schema oid = aSchemaOid ]