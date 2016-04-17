tests
testDefaultReturnValueWithoutException
	| promise |
	promise := [ 1 + 2 ] promise
		defaultReturnValue: 1;
		run;
		yourself.
	self assert: promise value equals: 3.
	
	promise := [ 1 + 2 ] promise
		defaultReturnValue: nil;
		run;
		yourself.
	self assert: promise value equals: 3