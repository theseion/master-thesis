tests
testIsSystemProcess
	| process |
	process := [ ] newProcess
		resume;
		yourself.
	self assert: process isSystemProcess.
	
	process := [ ] newUserProcess
		resume;
		yourself.
	self deny: process isSystemProcess