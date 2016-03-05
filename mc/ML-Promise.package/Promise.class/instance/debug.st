public-operations
debug
	self hasException ifFalse: [ ^ self ].
	
	self debug: exceptionContext