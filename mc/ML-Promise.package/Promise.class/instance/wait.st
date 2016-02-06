as yet unclassified
wait
	isSignaled ifTrue: [ ^ self ].
	semaphore wait