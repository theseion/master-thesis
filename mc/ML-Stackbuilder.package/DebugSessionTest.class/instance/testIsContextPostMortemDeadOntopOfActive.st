tests
testIsContextPostMortemDeadOntopOfActive
	| stopSemaphore continueSemaphore remoteProcess debugSession callerProcess |
	"Pretend that callerProcess spawned process. This is like
	running a process remotely and then debugging the remote stack
	in the context of the caller process (the remote stack is dead,
	the local one is live)."
	stopSemaphore := Semaphore new.
	continueSemaphore := Semaphore new.
	remoteProcess := [ continueSemaphore signal. [ 1/0 ] on: Error do: [ stopSemaphore wait ] ] fork.
	continueSemaphore wait.
	remoteProcess suspend.
	callerProcess := [ continueSemaphore signal. stopSemaphore wait ] fork.
	continueSemaphore wait.
	callerProcess suspend.
	
	remoteProcess suspendedContext bottomContext privSender: callerProcess suspendedContext.
	debugSession := callerProcess
		newDebugSessionNamed: 'test'
		startedAt: remoteProcess suspendedContext.
		
	"test top context"
	self assert: (debugSession isContextPostMortem: remoteProcess suspendedContext).
	"test other context"
	self assert: (debugSession isContextPostMortem: remoteProcess suspendedContext sender).
	"test active context"
	self deny: (debugSession isContextPostMortem: callerProcess suspendedContext).
	"but all the contexts are in the same sender chain"
	self assert: (remoteProcess suspendedContext findContextSuchThat: [ :ctxt |
		ctxt == callerProcess suspendedContext ]) notNil.
	"test nil context"
	self deny: (debugSession isContextPostMortem: nil)