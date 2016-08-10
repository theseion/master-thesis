tests
testStackContainsEvenReturnedFromContexts
	"The stack must contain all contexts, even those already returned from"
	| process |
	process := self newUserProcess.
	
	self assert: (process masterProcessHolder stack contains: [ :context |
		context selector = #newUserProcess and: [
			context methodClass = self class ] ])