private
trimmedExceptionStack
	"Remove unwanted stack frames"
	| stack context |
	stack := OrderedCollection new.
	"escape when the promise process is no longer part of the virtual process"
	self contextStore originProcess == interruptedProcess ifTrue: [ ^ stack ].
	
	context := interruptedContext.
	[
		context isNil or: [
			(self isLocalRunMethod: context) or: [
				self isRemoteRunMethod: context ] ] ] whileFalse: [
					stack addLast: context.
					context := context sender ].

	^ stack