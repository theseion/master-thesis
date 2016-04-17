tests
testDefaultReturnValueWithException
	| promise |
	promise := [ 1 + 2. self error ] promise
		defaultReturnValue: 1;
		yourself.
	self assert: promise value equals: 1.
	
	promise := [ self error. 1 + 2 ] promise
		defaultReturnValue: 1;
		yourself.
	self assert: promise value equals: 1.
	
	promise := [ 1 + 2. self error ] promise
		defaultReturnValue: nil;
		yourself.
	self
		should: [ promise value ]
		raise: PromiseProcessExceptionWarning
	