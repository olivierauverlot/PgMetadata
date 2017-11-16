tests-accessing
testListname
	self parse: 'FUNCEXPR' rule: #listname.
	self parse: 'CONST' rule: #listname.