simulation
interceptReturnContextForSender: aContext
	^ Context
		sender: aContext
		receiver: self
		method: self class>>#interceptReturnContext
		arguments: #()