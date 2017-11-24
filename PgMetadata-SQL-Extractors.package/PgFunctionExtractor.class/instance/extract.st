action
extract
	self runSQL do: [ :func | 
		| function resultType language namespace argnames argtypes |

		((func atName: #prorettypename) = 'trigger') 
			ifTrue: [  
				function := SqlTriggerFunction oid: (func atName: #oid) name: (func atName: #proname) owner: self database.
			] 
			ifFalse: [
				(func atName: #proisagg) 
					ifTrue: [  function := SqlAggregateFunction oid: (func atName: #oid) name: (func atName: #proname) owner: self database. ]
					ifFalse: [  function := SqlFunction oid: (func atName: #oid) name: (func atName: #proname) owner: self database ].
				argnames := func atName: #proargnames.
				argnames ifNotNil: [  
					argtypes := ((func atName: #proargtypes) substrings: ' ') collect: [ :oid | oid asInteger ].

					1 to: (argnames size) do: [ :i | 
						| argtype |
						argtype := self database addUniqueObject: (self getAllDatatypes detect: [ :datatype | datatype oid = (argtypes at: i) ]).
						function addArgument: (SqlArgument name: (argnames at: i) datatype: argtype owner: function). 
					]			
				]
			].
		
		function code: (func atName: 'prosrc').
		
		language := (SqlLanguage oid: (func atName: #prolang) name: (func atName: #prolangname) owner: self database).
		function language: (self database addUniqueObject: language).
		
		namespace := (SqlNamespace oid: (func atName: #pronamespace) name: (func atName: #pronamespacename) owner: self database).
		function namespace: (self database addUniqueObject: namespace).
		
		resultType := SqlDatatype oid: (func atName: #prorettype) name: (func atName: #prorettypename)  owner: (self database).
		function returnType: (self database addUniqueObject: resultType).
		

		self database addObject: function.
	].