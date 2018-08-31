action
extractNonTriggerFunctionFrom: func withOwner: owner toBeStub: isStub
	| argtypes function argnames |
	(func atName: #proisagg)
		ifTrue: [ function := SqlAggregateFunction
				oid: (func atName: #oid)
				name: (func atName: #proname)
				owner: owner
				stub: isStub ]
		ifFalse: [ function := SqlFunction
				oid: (func atName: #oid)
				name: (func atName: #proname)
				owner: owner
				stub: isStub ].
	argnames := func atName: #proargnames.
	"Arguments and types are only extracted if function is not stub"
	(isStub not and: [ argnames isNotNil ])
		ifTrue: [ argtypes := (func atName: #proallargtypes)
				ifNil: [ ((func atName: #proargtypes) substrings: ' ')
						collect: [ :oid | oid asInteger ] ]
				ifNotNil: [ ((func atName: #proallargtypes) allButFirst allButLast
						substrings: ',') collect: [ :oid | oid asInteger ] ].
			1 to: argnames size do: [ :i | 
				| argtype |
				argtype := self database
					addUniqueObject:
						(self getAllDatatypes
							detect: [ :datatype | datatype oid = (argtypes at: i) ]).
				function
					addArgument: (SqlArgument name: (argnames at: i) datatype: argtype owner: function) ] ].
	^ function