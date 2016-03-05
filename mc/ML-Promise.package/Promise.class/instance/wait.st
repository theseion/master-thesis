private
wait
	isSignaled ifTrue: [ ^ self ].
	semaphore wait