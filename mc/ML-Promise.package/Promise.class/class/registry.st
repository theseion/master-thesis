accessing
registry
	^ Registry ifNil: [
		Registry := WeakIdentityKeyDictionary new.
		WeakArray addWeakDependent: Registry ]