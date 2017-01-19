changing process state
terminate
	terminationSemaphore ifNotNil: [ :semaphore | semaphore signal ].
	
	super terminate