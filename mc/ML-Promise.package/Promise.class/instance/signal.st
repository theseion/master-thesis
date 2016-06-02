private
signal
	isSignaled ifTrue: [ ^ self ].
	
	semaphore signal.
	isSignaled := true