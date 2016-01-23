as yet unclassified
initialize
	self class announcer
		when: BuilderTrigger
		send: #trigger:
		to: self