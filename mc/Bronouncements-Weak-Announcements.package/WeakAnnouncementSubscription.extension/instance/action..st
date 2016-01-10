*bronouncements-weak-announcements
action: anObject

	action := anObject isBlock
		ifTrue: [ anObject outerContext: anObject outerContext asWeakReceiverContext; yourself ]
		ifFalse: [ anObject asWeakMessageSend ]