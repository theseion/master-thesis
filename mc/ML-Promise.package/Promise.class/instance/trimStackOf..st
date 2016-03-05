private
trimStackOf: aContext
	"Remove unwanted stack frames"
	| context |
	context := aContext findContextSuchThat: [ :ctxt |
		ctxt sender ifNil: [ ^ self ].
		ctxt sender receiver == self and: [ 
			ctxt sender selector = #run: ] ].
	context swapSender: self terminationContext