tests
testHasNext
	| process holder |
	process := self newUserProcess.
	holder := process masterProcessHolder holderForContext: thisContext.
	self assert: holder hasNext.
	
	[ holder notNil and: [
		holder hasNext ] ] whileTrue: [
			holder := holder next ].
		
	self deny: holder hasNext