as yet unclassified
initialize
	super initialize.
	
	semaphore := Semaphore new.
	isSignaled := false