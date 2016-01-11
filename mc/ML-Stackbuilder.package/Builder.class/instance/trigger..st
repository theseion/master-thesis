as yet unclassified
trigger: anAnnouncement
	| exceptionContext |
	self assert: callerProcess isSuspended.
	self assert: callerProcess isTerminated not.
	self assert: anAnnouncement exception notNil.
	self assert: anAnnouncement exception signalerContext notNil.
	
	exceptionContext := anAnnouncement exception signalerContext.
	exceptionContext bottomContext privSender: callerProcess suspendedContext.
	
	anAnnouncement exception debug