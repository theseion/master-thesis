testing
isContextPostMortem: selectedContext
	"return whether we're inspecting a frozen exception without a process attached"
	"| suspendedContext |
	suspendedContext := interruptedProcess suspendedContext.
	suspendedContext ifNil: [ ^ false ].
	(suspendedContext == selectedContext)
		ifTrue: [ ^ false ].
	^ (suspendedContext findContextSuchThat: [:c | c sender == selectedContext]) isNil"
	
	"a) the origin process may have exited
	b) the exception process may have exited (remote)
	c) some (or all) of the frames of the origin process may not be live
	d) if the origin process is the one waiting on the exception process
		proceed: normal
		over / into: normal (exception process returns default return value)
		restart: proceed the exception process so it terminates (default return value); otherwise normal
	e) if the origin process is *not* the one waiting on the exception process
		then it has not been suspended and hence all contexts must be treated as dead
	e) the frames of the exception process are either all live or all dead"
	^ (self contextStore originProcess suspendedContext notNil and: [
		self contextStore originProcess suspendedContext hasContext: selectedContext ])
		ifFalse: [
			self flag: 'check if exception process is still alive before returning false here'.
			false ]
		ifTrue: [ super isContextPostMortem: self contextStore originProcess suspendedContext ]