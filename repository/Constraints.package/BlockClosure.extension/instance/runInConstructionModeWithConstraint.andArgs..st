*Constraints
runInConstructionModeWithConstraint: aConstraint andArgs: anArray
	"This method constructs constraints for all solvable constraints inside this blockClosure. It uses the given constraint object."
	| newProcess |
	aConstraint isConstraintZ3
		ifFalse: [self error: 'This method only works with Z3, yet.'. ^ nil].
	newProcess := self newTerminatingProcessArgs: anArray.
	[#ccm withLayerDo: [[newProcess step] doWhileFalse: [newProcess suspendedContext isNil]]]
		ensure: [newProcess terminate].
	^ aConstraint expressions