tests
testPromiseException
	| promise |
	promise := [ 1 seconds asDelay wait. 1/0 ] promise.
	promise value.
	Processor yield.
	
	self assert: promise hasException.
	UIManager nonInteractiveDuring: [
		self
			should: [ promise debug ]
			raise: ProvideAnswerNotification
			whoseDescriptionIncludes: 'Opening Debugger'
			description: 'Debugging the promise should open a debugger' ]
		
	"Note that the current process will have been suspended in the #debug
	send. The proceed action on the debugger will resume this process and
	we'll end up here."