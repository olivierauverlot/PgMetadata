initialization
setUp
	| dt1 dt2 |
	db := PgDatabase name: 'testdb'.
	schema := SqlNamespace oid: 1 name: 'testschema' owner: db.
	table := SqlTable oid: 2 name: 'testtable' owner: db.
	db addObject: schema.
	db addObject: table.

	dt1 := SqlDatatype oid: 1000 name: 'character varying' owner: db.
	colname := (SqlColumn oid: 3 name: 'name' owner: table).
	colname datatype: (db addUniqueObject: dt1).
	colname isNotNull: false.
	colname length: 255.
	db addObject: colname.
	
	colsurname := (SqlColumn oid: 4 name: 'surname' owner: table).
	colsurname datatype: (db addUniqueObject: dt1).
	colsurname hasDefaultValue: nil.
	colsurname isNotNull: true.
	colsurname length: 255.
	db addObject: colsurname.
	
	dt2 := SqlDatatype oid: 1001 name: 'int2' owner: db.
	colage := (SqlColumn oid: 5 name: 'age' owner: table).
	colage datatype: (db addUniqueObject: dt2).
	colage hasDefaultValue: 0.
	colage isNotNull: true.
	colage length: 255.
	db addObject: colage.
	
