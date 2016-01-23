as yet unclassified
trigger: anAnnouncement
	| exceptionContext |
	self assert: anAnnouncement exception notNil.
	self assert: anAnnouncement exception signalerContext notNil.

	exceptionContext := anAnnouncement exception signalerContext.
	exceptionContext bottomContext privSender: StackCopy.
	anAnnouncement exception debug