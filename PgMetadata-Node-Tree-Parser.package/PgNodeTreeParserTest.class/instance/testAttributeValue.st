tests-accessing
testAttributeValue
	self parse: 'true' rule: #attributeValue.
	self parse: 'false' rule: #attributeValue.
	self parse: '1' rule: #attributeValue.
	self parse: '42' rule: #attributeValue.
	self parse: '-1' rule: #attributeValue.
	self parse: '({CONST :consttype 2205 :consttypmod -1 :constcollid 0 :constlen 4 :constbyval true :constisnull false :location 74 :constvalue 4 [ -19 -38 0 0 0 0 0 0 ]})' rule: #attributeValue.
	