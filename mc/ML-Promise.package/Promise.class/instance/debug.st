public-operations
debug
	self hasException ifFalse: [ ^ self ].
	
	PromiseDebugHandler handle: self