instance creation
handle: aPromise
	^ self new
		promise: aPromise;
		run;
		yourself