public-operations
debug
	self hasException ifFalse: [ ^ self ].
	
	RemotePromiseDebugHandler handle: self