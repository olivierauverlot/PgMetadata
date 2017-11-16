accessing
attributeAndValue
	^ super attributeAndValue ==> [ :tokens | tokens first -> tokens second ]