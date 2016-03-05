accessing
registry
	^ Registry ifNil: [ Registry := WeakIdentityKeyDictionary new ]