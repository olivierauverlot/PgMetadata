tests-accessing
testBoolean
	self parse: 'true' rule: #boolean.
	self parse: 'false' rule: #boolean.