tests
testIsContextPostMortemExceptionInDifferentProcess
	| stopSemaphore continueSemaphore process debugSession debugProcess |
	stopSemaphore := Semaphore new.
	continueSemaphore := Semaphore new.
	process := [ continueSemaphore signal. [ 1/0 ] on: Error do: [ stopSemaphore wait ] ] fork.
	continueSemaphore wait.
	process suspend.
	debugProcess := [ continueSemaphore signal. stopSemaphore wait ] fork.
	continueSemaphore wait.
	debugProcess suspend.
	debugSession := debugProcess
		newDebugSessionNamed: 'test'
		startedAt: process suspendedContext.
		
	"test top context"
	self assert: (debugSession isContextPostMortem: process suspendedContext).
	"test other context"
	self assert: (debugSession isContextPostMortem: process suspendedContext sender).
	"test nil context"
	self deny: (debugSession isContextPostMortem: nil)