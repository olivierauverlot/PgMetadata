accessing
list
	^ super list ==> [ :tokens | 
		PgNodeTree new
			name: tokens second;
			attributes: tokens third asDictionary;
			byteArray: tokens fourth;
			yourself ]