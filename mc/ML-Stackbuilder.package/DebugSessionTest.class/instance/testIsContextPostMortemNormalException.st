tests
testIsContextPostMortemNormalException
	| stopSemaphore continueSemaphore process debugSession |
	stopSemaphore := Semaphore new.
	continueSemaphore := Semaphore new.
	process := [ continueSemaphore signal. [ 1/0 ] on: Error do: [ stopSemaphore wait ] ] fork.
	continueSemaphore wait.
	process suspend.
	debugSession := process
		newDebugSessionNamed: 'test'
		startedAt: process suspendedContext.
		
	"test top context"
	self deny: (debugSession isContextPostMortem: process suspendedContext).
	"test other context"
	self deny: (debugSession isContextPostMortem: process suspendedContext sender).
	"test nil context"
	self deny: (debugSession isContextPostMortem: nil)