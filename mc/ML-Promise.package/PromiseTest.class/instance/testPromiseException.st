as yet unclassified
testPromiseException
	| promise |
	promise := [ 1 seconds asDelay wait. 1/0 ] promise.
	promise value.
	Processor yield.
	
	self assert: promise hasException.
	promise debug.
	"The halt will be triggered if we proceed from the
	promise debugger"
	self halt.