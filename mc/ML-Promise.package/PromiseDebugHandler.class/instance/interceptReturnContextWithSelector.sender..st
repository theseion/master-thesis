simulation
interceptReturnContextWithSelector: aSelector sender: aContext
	^ Context
		sender: aContext
		receiver: self
		method: self class>>aSelector
		arguments: #()