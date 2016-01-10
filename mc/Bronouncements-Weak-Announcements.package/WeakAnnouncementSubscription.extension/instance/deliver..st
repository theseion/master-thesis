*bronouncements-weak-announcements
deliver: anAnnouncement
	" deliver an announcement to receiver. In case of failure, it will be handled in separate process"

	^ (self handlesAnnouncement: anAnnouncement ) ifTrue: [
		[(action isBlock
			ifTrue: [ action copy outerContext: action outerContext asContext; yourself ]
			ifFalse: [ action ]) cull: anAnnouncement cull: announcer] 
			on: UnhandledError fork: [:ex | ex pass ]]