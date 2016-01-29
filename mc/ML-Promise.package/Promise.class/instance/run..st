as yet unclassified
run: aBlock
	"self createDebugContinuation."
	[ 
		| value |
		self withErrorHandler: [
			[ value := aBlock value ] ensure: [
				"store return value"
				self registry
					at: self
					put: value.
				"signal that we're finished and the promise is ready"
				self signal ] ] ] fork.
	
	"Ensure the promise runs until the external process blocks"
	Processor yield