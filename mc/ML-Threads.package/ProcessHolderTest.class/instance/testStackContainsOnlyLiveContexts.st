tests
testStackContainsOnlyLiveContexts
	"Any dead contexts will be replaced by copies, the copies are still live"
	| process |
	process := self newUserProcess.
	
	self assert: (process masterProcessHolder stack noneSatisfy: [ :context |
		context isDead ])