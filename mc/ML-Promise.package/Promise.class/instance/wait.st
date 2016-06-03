private
wait
	| delay |
	isSignaled ifTrue: [ ^ self ].
	
	wasStarted ifFalse: [ self run ].
	self hasTimeout
		ifFalse: [ semaphore wait ]
		ifTrue: [
				delay := DelayWaitTimeout new
					setDelay: timeout asMilliSeconds
					forSemaphore: semaphore.
				delay
					waitOnCompletion: [ ]
					onTimeout: [
						self registry
							at: self
							put: defaultReturnValue.
						onTimeoutBlock value.
						self signal ] ]