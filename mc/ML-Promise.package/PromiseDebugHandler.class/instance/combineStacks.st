private
combineStacks
	"Exception process: ...c-c-c-new bottom-|hidden contexts|
	Origin process: |hidden contexts|-new top-c-c-c...
	New process: ...c-c-c-interceptor-interceptor-c-c-c..."
	| interceptor |
	interceptor := self interceptReturnContextForSender: self contextStore originContext.

	self contextStore exceptionContext bottomContext swapSender: interceptor.
	self contextStore originContext: interceptor