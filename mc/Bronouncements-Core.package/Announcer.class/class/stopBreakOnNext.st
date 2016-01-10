bronouncements
stopBreakOnNext
	shouldBreakOnNext := false.
	currentBreakerAnnouncement := nil.
	
	self allSubclassesDo: [ :ann | ann stopBreakOnNext ]