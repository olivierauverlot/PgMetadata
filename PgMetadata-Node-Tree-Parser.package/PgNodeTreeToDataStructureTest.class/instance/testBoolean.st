tests-accessing
testBoolean
	self
		assert: (builder boolean parse: 'true');
		deny: (builder boolean parse: 'false')