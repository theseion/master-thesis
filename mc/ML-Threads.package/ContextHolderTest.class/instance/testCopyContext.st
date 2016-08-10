tests
testCopyContext
	| process holder |
	process := self newUserProcess.
	holder := process masterProcessHolder holderForContext: thisContext.
	
	self deny: holder copyContext == thisContext.
	self deny: holder originalContext == holder copyContext.
	self assert: holder originalContext == thisContext