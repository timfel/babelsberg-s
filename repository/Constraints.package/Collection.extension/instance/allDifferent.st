*Constraints
allDifferent
"This method is used in constraint construction mode."
	| expression allDifferentExpression |
	"TODO: check whether the current solver is Z3. If not, raise an ConstraintUnsatisfiableError. Do it without sending activeProcess to Process"
	(self allSatisfy: [:each | each isConstraintVariable])
		ifTrue: [expression := ConstraintDistinctExpression new.
			self do: [:each | expression addVariable: each].
			^ expression].
	"All pairs of elements are different, based on =."
	allDifferentExpression := nil.
	(1 to: self size - 1) do: [:i |
		(i+1 to: self size) do: [:j | | expr |
			expr := ((self at: i) = (self at: j)) not.
			allDifferentExpression 
				ifNil: [allDifferentExpression := expr]
				ifNotNil: [allDifferentExpression := allDifferentExpression & expr]]].
	^ allDifferentExpression