private
run: aBlock
	"self createDebugContinuation."
	[
		[ self withErrorHandler: [
			self registry
				at: self
				put: aBlock value ] ] ensure: [
				"signal that we're finished and the promise is ready"
				self signal ] ] fork.
	
	"Ensure the promise runs until the external process blocks"
	Processor yield