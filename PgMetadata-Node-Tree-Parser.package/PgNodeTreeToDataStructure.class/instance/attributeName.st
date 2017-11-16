accessing
attributeName
	^ super attributeName ==> [ :tokens | String newFrom: tokens second ]