tests
testHasContext
	| process |
	process := self newUserProcess.
	
	self assert: (process masterProcessHolder hasContext: thisContext).
	self deny: (process masterProcessHolder hasContext: nil)