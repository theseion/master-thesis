private
run: aBlock
	<promiseRunMethod>
	self contextStore freezeOrigin.
	process := [
		[ self withExceptionHandler: [
			self registry
				at: self
				put: aBlock value ] ] ensure: [
				"signal that we're finished and the promise is ready"
				self signal ] ] newProcess