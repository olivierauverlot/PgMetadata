private
collectConstraintClasse
	constraintClasses := Dictionary new.
	SqlConstraint subclasses do: [ :c | constraintClasses at: (c conType) put: c ]