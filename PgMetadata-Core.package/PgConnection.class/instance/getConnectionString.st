action
getConnectionString
	| string |
	string := WriteStream on: String new.
	string 
		nextPutAll: 'postgresV2://';
		nextPutAll: self hostname;
		nextPutAll: ':';
		nextPutAll: (self port asString);
		nextPutAll: '/';
		nextPutAll: self database;
		nextPutAll: '?user=';
		nextPutAll: self user;
		nextPutAll: '&password=';
		nextPutAll: self password.
	^string contents