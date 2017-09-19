initialize
hostname: aHostname port: aPort database: aDatabaseName user: aUserName password: aPassword
	^self new 
		hostname: aHostname;
		port: aPort;
		database: aDatabaseName;
		user: aUserName;
		password: aPassword;
		yourself