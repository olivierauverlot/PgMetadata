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
	PgFKConstraintExtractor.
		
	"extract references"
	PgInheritanceReferencesExtractor.
} asOrderedCollection.