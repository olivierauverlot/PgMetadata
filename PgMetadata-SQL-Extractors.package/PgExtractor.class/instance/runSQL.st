action
runSQL
	^self connection execute: (self sqlRequest)