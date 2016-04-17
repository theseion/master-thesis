initialization
initialize
	super initialize.
	
	semaphore := Semaphore new.
	isSignaled := false.
	openDebuggerOnError := false.
	defaultReturnValue := nil.
	wasStarted := false