action
extractMetaInformations
	"extraction of datatypes"
	(self database connection execute: 'SELECT oid,typname,typnamespace FROM pg_type') do: [ :datatype |
		self datatypes add: (SqlDatatype oid: ((datatype atName: #oid) asInteger) name: (datatype atName: #typname) owner: self database)
	].