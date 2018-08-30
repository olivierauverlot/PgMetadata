action
extractStubFunctions: isStub
	self runSQL do: [ :func | 
		| function resultType language namespace argnames argtypes owner |
		
		isStub ifTrue: [ owner := nil ] ifFalse: [owner := self database ].
		
		((func atName: #prorettypename) = 'trigger') 
			ifTrue: [  
				function := SqlTriggerFunction oid: (func atName: #oid) name: (func atName: #proname) owner: owner stub: isStub.
			] 
			ifFalse: [
				(func atName: #proisagg) 
					ifTrue: [ function := SqlAggregateFunction oid: (func atName: #oid) name: (func atName: #proname) owner: owner stub: isStub. ]
					ifFalse: [ function := SqlFunction oid: (func atName: #oid) name: (func atName: #proname) owner: owner stub: isStub ].
				argnames := func atName: #proargnames.
				"Arguments and types are only extracted if function is not stub"
				(isStub not and: [ argnames isNotNil ]) ifTrue: [  
					argtypes := ((func atName: #proargtypes) substrings: ' ') collect: [ :oid | oid asInteger ].
					
					1 to: (argnames size) do: [ :i | 
						| argtype |
						argtype := self database addUniqueObject: (self getAllDatatypes detect: [ :datatype | datatype oid = (argtypes at: (i min: argtypes size)) ]). self flag: 'This is a HACK to bypass problem with OUT parameters.'.
						function addArgument: (SqlArgument name: (argnames at: i) datatype: argtype owner: function). 
					]			
				]
			].
		
		function code: (func atName: 'prosrc').
		
		language := (SqlLanguage oid: (func atName: #prolang) name: (func atName: #prolangname) owner: owner).
		function language: (self database addUniqueObject: language).
		
		namespace := (SqlNamespace oid: (func atName: #pronamespace) name: (func atName: #pronamespacename) owner: owner).
		function namespace: (self database addUniqueObject: namespace).
		
		resultType := SqlDatatype oid: (func atName: #prorettype) name: (func atName: #prorettypename)  owner: owner.
		function returnType: (self database addUniqueObject: resultType).
		

		self database addObject: function.
	].