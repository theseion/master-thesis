instance creation
fromContext: aContext
	^ (self newForMethod: aContext method)
		initializeWith: aContext;
		yourself