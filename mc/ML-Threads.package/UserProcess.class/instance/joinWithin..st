synchronizing
joinWithin: aDuration
	terminationSemaphore := Semaphore new.
	terminationSemaphore
		wait: aDuration
		onCompletion: [ ]
		onTimeout: [ self terminate ]