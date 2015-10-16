brounouncements
shouldBreakOnNext: anAnnouncement
	self class shouldBreakOnNext ifFalse: [ ^ false ].
	
	^ anAnnouncement isKindOf: self class currentBreakerAnnouncement