as yet unclassified
trimStackOf: aContext
	"Remove unwanted stack frames"
	| context activeProcess |
	activeProcess := Processor activeProcess.
	context := aContext findContextSuchThat: [ :ctxt |
		ctxt sender ifNil: [ ^ self ].
		ctxt sender receiver == self and: [ 
			ctxt sender selector = #run: ] ].
	context swapSender: [
		activeProcess
			suspendedContext: activeProcess suspendedContext sender;
			resume.
		Processor activeProcess terminate ] asContext