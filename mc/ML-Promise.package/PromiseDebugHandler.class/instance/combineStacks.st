private
combineStacks
	"Exception process: ...c-c-c-new bottom-|hidden contexts|
	Origin process: |hidden contexts|-new top-c-c-c...
	New process: ...c-c-c-interceptor-interceptor-c-c-c..."
	| bottomContext bottomInterceptor topInterceptor |
	topInterceptor := self
		interceptReturnContextWithSelector: #interceptReturnToNewOriginTopContext
		sender: self contextStore originContext.
	bottomContext := self contextStore exceptionContext bottomContext.
	bottomInterceptor := self
		interceptReturnContextWithSelector: #interceptReturnFromNewExceptionBottomContext
		sender: topInterceptor.

	bottomContext swapSender: bottomInterceptor.
	self contextStore originContext: topInterceptor