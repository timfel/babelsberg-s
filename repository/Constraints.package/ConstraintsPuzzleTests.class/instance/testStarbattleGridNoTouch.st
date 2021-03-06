testing
testStarbattleGridNoTouch

	| starbattle solver |
	starbattle := StarbattleGrid buildFromString: StarbattleGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.

	(1 to: starbattle rowCount) do: [:column | 
		self shouldnt: [
			[((starbattle mooreNeighborsOfX: 1 y: column)
				count: [:neighborCell | neighborCell isStar] equals: 0) |
			((starbattle at: 1 at: column) isStar not)] alwaysSolveWith: solver] 
		raise: Error].

	(1 to: starbattle rowCount) do: [:column | 
		self should: [ 
			((starbattle mooreNeighborsOfX: 1 y: column)
				count: [:neighborCell | neighborCell isStar] equals: 0) |
			((starbattle at: 1 at: column) isStar not)]].