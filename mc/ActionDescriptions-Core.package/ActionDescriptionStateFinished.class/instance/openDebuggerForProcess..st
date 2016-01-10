private
openDebuggerForProcess: aProcess
	self context ifNil: [ ^ self ].
	
	[
		| session |
		"The debugger should display the compiled method witouth meta link bytecode.
		Works only, if there's no closure over the method."
		"
		Unfortunately this corrupts the self binding...
		aContext isBlockContext ifFalse: [
			aContext method recompile.
			aContext privRefreshWith: aContext methodClass >> aContext selector ]."
		
		session := self description debuggerClass sessionClass
			named: 'foo'
			on: aProcess
			startedAt: self context.

		"I'd like to step to the first interesting bytecode here but whatever I do,
		the self binding is messed up if I do it."

		[self description debuggerClass
			openOn: session
			withFullView: true] on: Error do: [ :ex |
				self description uninstall.
				ex pass ]
	] fork.
	
	aProcess suspend