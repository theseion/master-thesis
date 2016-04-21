private
withExceptionHandler: aBlock
	PromiseExceptionHandler
		handle: self
		during: aBlock