tests-accessing
testAttributeName
	self
		assert: (builder attributeName parse: ':foo') equals: 'foo'