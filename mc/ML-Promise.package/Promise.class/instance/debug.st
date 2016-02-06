as yet unclassified
debug
	self hasException ifFalse: [ ^ self ].
	
	self debug: exceptionContext