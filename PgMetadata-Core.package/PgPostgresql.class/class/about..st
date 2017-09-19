initialize
about: aPgDatabase
	^ self new
		database: aPgDatabase;
		extractMetaInformations;
		yourself