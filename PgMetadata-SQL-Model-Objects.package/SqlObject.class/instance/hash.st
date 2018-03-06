comparing
hash
	^ (self oid hash bitXor: self name hash) bitXor: self owner hash