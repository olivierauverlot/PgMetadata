action
extractStubFunctions: isStub
	self runSQL
		do: [ :func | 
			| function resultType language namespace owner |
			owner := isStub ifTrue: [ nil ] ifFalse: [ self database ].
			function := (func atName: #prorettypename) = 'trigger'
				ifTrue: [ SqlTriggerFunction oid: (func atName: #oid) name: (func atName: #proname) owner: owner stub: isStub ]
				ifFalse: [ self extractNonTriggerFunctionFrom: func withOwner: owner toBeStub: isStub ].
			function code: (func atName: 'prosrc').
			language := SqlLanguage
				oid: (func atName: #prolang)
				name: (func atName: #prolangname)
				owner: owner.
			function language: (self database addUniqueObject: language).
			namespace := SqlNamespace
				oid: (func atName: #pronamespace)
				name: (func atName: #pronamespacename)
				owner: owner.
			function namespace: (self database addUniqueObject: namespace).
			resultType := SqlDatatype
				oid: (func atName: #prorettype)
				name: (func atName: #prorettypename)
				owner: owner.
			function returnType: (self database addUniqueObject: resultType).
			self database addObject: function ]