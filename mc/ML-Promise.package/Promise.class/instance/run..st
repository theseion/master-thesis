private
run: aBlock
	<promiseEntryPoint>
	self freezeContexts.
	process := [
		[ self withErrorHandler: [
			self registry
				at: self
				put: aBlock value ] ] ensure: [
				"signal that we're finished and the promise is ready"
				self signal ] ] newProcess