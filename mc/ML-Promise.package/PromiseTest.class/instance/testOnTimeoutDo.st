tests
testOnTimeoutDo
	| hit promise |
	hit := false.
	promise := [ 50 milliSeconds asDelay wait. 1 ] promise
		onTimeoutDo: [ hit := true ];
		value;
		yourself.
	
	self deny: hit.
	self assert: promise value equals: 1.
	
	promise := [ 50 milliSeconds asDelay wait. 1 ] promise
		timeout: 20 milliSeconds;
		onTimeoutDo: [ hit := true ];
		defaultReturnValue: 0;
		value;
		yourself.
		
	self assert: hit.
	self assert: promise value equals: 0
	