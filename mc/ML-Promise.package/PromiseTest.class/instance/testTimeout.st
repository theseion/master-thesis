tests
testTimeout
	| promise runTime |
	promise := [ 100 milliSeconds asDelay wait ] promise.
	runTime := [ promise value ] timeToRun.
 
	self assert: runTime >= 100 milliSeconds.
	
	
	promise := [ 150 milliSeconds asDelay wait ] promise
		timeout: 100 milliSeconds;
		defaultReturnValue: 1;
		yourself.
	runTime := [ promise value ] timeToRun.
 
	self assert: runTime >= 100 milliSeconds.
	self assert: runTime < 150 milliSeconds.
	self assert: promise value equals: 1