action
extractNonTriggerFunctionFrom: func withOwner: owner toBeStub: isStub
	| argtypes function argnames |
	function := (func atName: #prokind)
		ifTrue: [ SqlAggregateFunction
				oid: (func atName: #oid)
				name: (func atName: #proname)
				owner: owner
				stub: isStub ]
		ifFalse: [ SqlFunction
				oid: (func atName: #oid)
				name: (func atName: #proname)
				owner: owner
				stub: isStub ].
	argnames := func atName: #proargnames.
	"Arguments and types are only extracted if function is not stub"
	(isStub not and: [ argnames isNotNil ])
		ifTrue: [ argtypes := self extractArgumentsTypesFrom: func.
			argnames
				with: argtypes
				do: [ :argname :argtype | 
					function
						addArgument: (SqlArgument name: argname datatype: argtype owner: function) ] ].
	^ function