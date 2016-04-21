private
trimExceptionStack
	"Remove unwanted stack frames"
	| context |
	context := self contextStore exceptionContext findContextSuchThat: [ :ctxt |
		ctxt sender notNil and: [
			"local"
			(ctxt sender method hasPragmaNamed: #promiseEntryPoint) or: [
				"remote"
				ctxt sender selector = #executeFor: ] ] ].
	context ifNil: [ ^ self ].
	context swapSender: nil