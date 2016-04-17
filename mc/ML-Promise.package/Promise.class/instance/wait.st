private
wait
	isSignaled ifTrue: [ ^ self ].
	wasStarted ifFalse: [ process resume ].
	semaphore wait