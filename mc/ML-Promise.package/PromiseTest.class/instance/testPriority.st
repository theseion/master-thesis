tests
testPriority
	| promise process |
	promise := [ 100 milliSeconds asDelay wait ] promise.
	process := promise instVarNamed: 'process'.
	self assert: process priority equals: Processor activePriority.
	
	promise priority: 10.
	self assert: process priority equals: 10