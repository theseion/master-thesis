debugging actions
stepThrough: aContext
	"Send messages until you return to selectedContext.
	 Used to step into a block in the method."
	
	| top |
	(self isContextPostMortem: aContext) ifTrue: [^ self].

	self flag: 'This doesn''t work yet. #home answers an instance variable that is bound to a context
	that is not in the chain since #copyTo: does not update closures'.
	top := interruptedProcess suspendedContext.
	((top willReturn or: [
		top willBlockReturn ]) and: [
			top sender method hasPragmaNamed: #filterContexts ]) ifTrue: [
				self stepOver: top ].
	interruptedProcess stepToHome: aContext.
	self updateContextTo: (self stepToFirstInterestingBytecodeIn: interruptedProcess).
			
	self triggerEvent: #stepThrough 