bronouncements
breakOnNext: anAnnouncement
	currentBreakerAnnouncement := anAnnouncement class theNonMetaClass.
	shouldBreakOnNext := true.
	
	self allSubclassesDo: [ :ann | ann breakOnNext: anAnnouncement ]