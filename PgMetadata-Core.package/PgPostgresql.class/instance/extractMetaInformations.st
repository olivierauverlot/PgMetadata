action
extractMetaInformations
	"extraction of datatypes"

	(self database connection
		execute: 'SELECT oid,typname,typnamespace FROM pg_type')
		do: [ :datatype | 
			self datatypes
				add:
					(SqlDatatype
						oid: (datatype atName: #oid) asInteger
						name: (datatype atName: #typname)
						owner: self database) ].

	"getting version"
	(self database connection execute: 'SHOW server_version')
		do: [ :versionString | 
			| versionParts major |
			versionParts := (versionString atIndex: 1) splitOn: $..
			major := versionParts first asNumber.
			self
				databaseMajorVersion:
					(major > 9
						ifTrue: [ major ]
						ifFalse: [ ('.'
								join:
									{major asString.
									versionParts second}) asNumber ]) ]