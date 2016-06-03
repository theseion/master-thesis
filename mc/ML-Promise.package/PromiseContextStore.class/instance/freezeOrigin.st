accessing
freezeOrigin
	| context |
	originProcess := Processor activeProcess.
	originStack := OrderedCollection new.
	originContext := thisContext findContextSuchThat: [ :ctxt |
		ctxt method hasPragmaNamed: #promiseEntryPoint ].
	
	context := originContext.
	[ context isNil ] whileFalse: [
		originStack addLast: context.
		context := context sender ]