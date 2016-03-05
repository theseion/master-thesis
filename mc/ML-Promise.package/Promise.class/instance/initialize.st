initialization
initialize
	super initialize.
	
	semaphore := Semaphore new.
	isSignaled := false