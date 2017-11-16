tests-accessing
testNumber
	self parse: '1' rule: #number.
	self parse: '42' rule: #number.
	self parse: '-1' rule: #number.
	self fail: 'a' rule: #number.