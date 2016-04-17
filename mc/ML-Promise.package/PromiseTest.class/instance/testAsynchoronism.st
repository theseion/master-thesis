tests
testAsynchoronism
	| promise before runTime |
	before := nil.
	promise := [ 
		"simulate call setup"
		before := 1.
		"simulate waiting for call to finish"
		100 milliSeconds asDelay wait.
		"simulate result"
		1 + 3 ] promise run.
	"call should be issued immediately, so everthing up to
	the call itself should be executed."
	self assert: before equals: 1.
	
	"#value will block"
	runTime := [ promise value ] timeToRun.
	
	self assert: runTime >= 100 milliSeconds.
	self assert: runTime < 150 milliSeconds.
	self assert: promise value equals: 4