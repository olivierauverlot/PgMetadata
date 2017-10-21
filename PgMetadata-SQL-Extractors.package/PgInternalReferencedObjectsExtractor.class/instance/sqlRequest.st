parameters
sqlRequest
	^'SELECT classid,objid,objsubid,refclassid,refobjid,refobjsubid,deptype FROM pg_depend WHERE objid <> 0 and objsubid <> 0'