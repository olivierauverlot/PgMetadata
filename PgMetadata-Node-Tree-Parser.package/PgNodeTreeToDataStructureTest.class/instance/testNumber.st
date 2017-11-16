tests-accessing
testNumber
	self
		assert: (builder number parse: '1') equals: 1;
		assert: (builder number parse: '-1') equals: -1;
		assert: (builder number parse: '42') equals: 42