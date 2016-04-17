tests
testPromise
	| promise start value before |
	before := nil.
	promise := [ 
		"simulate call setup"
		before := 1.
		"simulate waiting for call to finish"
		1 seconds asDelay wait.
		"simulate result"
		1 + 3 ] promise run.
	"call should be issued immediately, so everthing up to
	the call itself should be executed."
	self assert: before equals: 1.
	
	start := Time millisecondClockValue.
	"#value will block"
	value := promise value.
	
	self assert: (Time millisecondsSince: start) > 1000.
	self assert: value equals: 4