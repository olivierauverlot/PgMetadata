initialize-release
initialize
	
steps := {
	"extract objects"
	PgLanguageExtractor.
	PgExtensionExtractor.
	PgNamespaceExtractor.
	PgSequenceExtractor.
	PgTableExtractor.
	PgViewExtractor.
	PgMaterializedViewExtractor.
	PgColumnExtractor.
	PgFunctionExtractor.
	PgTriggerExtractor.
	PgFKConstraintExtractor.

	"extract default values"
	PgDefaultValueExtractor.
			
	"extract references"
	PgInheritanceReferencesExtractor.
	
	"extract internal referenced objects"
	PgInternalReferencedObjectsExtractor
} asOrderedCollection.