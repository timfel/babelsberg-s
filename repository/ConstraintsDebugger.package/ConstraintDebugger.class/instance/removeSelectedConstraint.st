constraints-access
removeSelectedConstraint
	| co |
	co := (Processor activeProcess environmentAt: #constraintObject).
	self flag: #XXX.
	(co respondsTo: #externalConstraints)
		ifTrue: [co externalConstraints removeAt: self constraintIndex]
		ifFalse: [co expressions removeAt: self constraintIndex].
	self changed: #constraintList.
	self changed: #constraintIndex.