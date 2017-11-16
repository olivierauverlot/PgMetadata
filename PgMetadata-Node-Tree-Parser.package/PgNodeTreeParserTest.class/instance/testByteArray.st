tests-accessing
testByteArray
	self parse: '[ 0 0 0 0 0 0 0 0 ]' rule: #byteArray.
	self parse: '[ -19 -38 0 0 104 101 108 108 111 ]' rule: #byteArray.