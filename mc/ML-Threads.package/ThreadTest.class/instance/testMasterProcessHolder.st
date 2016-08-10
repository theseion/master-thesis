tests
testMasterProcessHolder
	| process process2 |
	process := [ ] newUserProcess
		resume;
		yourself.
	
	self assert: process masterProcessHolder notNil.
	self assert: process masterProcessHolder process == Processor activeProcess.
	
	process2 := [ ] newUserProcess
		resume;
		yourself.
	process masterProcessHolder: (ProcessHolder for: process2).
	
	self assert: process masterProcessHolder process == process2.
	self assert: process2 masterProcessHolder process == Processor activeProcess