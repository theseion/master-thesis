*bronouncements-weak-announcements
makeWeak
	

	^ announcer replace: self with: 
		(WeakAnnouncementSubscription new
			announcer: announcer;
			action: action;
			subscriber: subscriber;
			announcementClass: announcementClass)