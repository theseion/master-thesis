brounouncements
announce: anAnnouncement

	| announcement |
	self handleAnnouncementBreakpointFor: anAnnouncement.
		
	announcement := anAnnouncement asAnnouncement.	
	registry ifNotNil: [
		registry deliver: announcement
		].
	^ announcement