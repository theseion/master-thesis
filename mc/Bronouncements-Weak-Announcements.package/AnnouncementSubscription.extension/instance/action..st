*bronouncements-weak-announcements
action: anObject

	action := anObject isBlock
		ifTrue: [ anObject outerContext: anObject outerContext asContext; yourself ]
		ifFalse: [ anObject asMessageSend ]