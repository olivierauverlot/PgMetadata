action
runSQLWith: aParametersList
	^self connection execute: (self sqlRequest format: aParametersList)