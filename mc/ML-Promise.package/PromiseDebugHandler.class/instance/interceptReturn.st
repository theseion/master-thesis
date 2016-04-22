simulation
interceptReturn
	<filterThis>
	| returnValue sender |
	returnValue := thisContext top.
	sender := self senderOf: self.
	thisContext
		return: returnValue
		to: sender