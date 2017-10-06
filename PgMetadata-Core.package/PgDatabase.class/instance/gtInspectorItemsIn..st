gt-inspector-extension
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0> 
	^ (composite fastList)
		title: 'SQL objects';
		display: [ self objects asOrderedCollection ];
		beMultiple;	
		format: [ :each | GTObjectPrinter asTruncatedTextFrom: each ];
		send: [ :result | result isNil 
			ifTrue:[nil]
			ifFalse:[ (result size = 1) 
				ifTrue: [result anyOne] 
				ifFalse: [self species withAll: result]]]