brounouncements
handleAnnouncementBreakpointFor: anAnnouncement
	(self shouldBreakOnNext: anAnnouncement) ifFalse: [ ^ self ].
	
	self openDebuggerFor: anAnnouncement