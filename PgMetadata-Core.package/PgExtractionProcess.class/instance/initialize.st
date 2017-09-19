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

	"extract constraints"
	PgConstraintExtractor.
		
	"extract references"
	PgInheritanceReferencesExtractor.
} asOrderedCollection.