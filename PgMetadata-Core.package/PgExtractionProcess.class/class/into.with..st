initialize
into: aDatabase with: aConnection
	^self new 
		database: aDatabase;
		connection: aConnection;
		extractAll;
		yourself 