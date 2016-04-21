instance creation
handle: aPromise during: aBlock
	^ self new
		promise: aPromise;
		block: aBlock;
		run;
		yourself