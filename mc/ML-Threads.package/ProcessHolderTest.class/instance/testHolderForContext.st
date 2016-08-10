tests
testHolderForContext
	| process contextHolder |
	process := self newUserProcess.
	
	contextHolder := process masterProcessHolder holderForContext: thisContext.
	self assert: contextHolder originalContext == thisContext