as yet unclassified
initialize
	self class announcer weak
		when: BuilderTrigger
		send: #trigger:
		to: self