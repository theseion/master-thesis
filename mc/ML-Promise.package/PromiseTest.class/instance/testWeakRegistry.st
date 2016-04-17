tests
testWeakRegistry
	| promise |
	[ Promise registry slowSize = 0 ] whileFalse: [
		Smalltalk garbageCollect.
		20 milliSeconds asDelay wait ].
	
	self assert: Promise registry slowSize equals: 0.
	
	promise := [ 1 + 2 ] promise
		value; 
		yourself.
	self deny: Promise registry isEmpty.
	self assert: Promise registry slowSize equals: 1.
	
	promise := nil.
	Smalltalk garbageCollect.
	self assert: Promise registry slowSize equals: 0