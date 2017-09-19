initialize
database: aDBName connection: aPgConnection

	^self new 
		database: aDBName;
		connection: aPgConnection;
		yourself