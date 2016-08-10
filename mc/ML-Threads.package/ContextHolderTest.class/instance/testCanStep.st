tests
testCanStep
	"#canStep only answers true when we have a live context."
	| semaphore process holder processContext process2 |
	semaphore := Semaphore new.
	process := [
		processContext := thisContext.
		process2 := self newUserProcess.
		semaphore signal.
		Processor activeProcess suspend ] newUserProcess
					resume;
					yourself.
	semaphore wait.

	[
		self assert: process2 masterProcessHolder process == process.
		holder := process2 masterProcessHolder holderForContext: process2 masterProcessHolder stack first.
		self deny: holder canStep. "already returned from"
		holder := process2 masterProcessHolder holderForContext: processContext.
		self assert: holder canStep
	] ensure: [ process resume ]