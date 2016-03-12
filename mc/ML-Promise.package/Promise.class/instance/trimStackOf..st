private
trimStackOf: aContext
	"Remove unwanted stack frames"
	| context |
	context := aContext findContextSuchThat: [ :ctxt |
		ctxt sender notNil and: [
			"local"
			(ctxt sender method hasPragmaNamed: #promiseEntryPoint) or: [
				"remote"
				ctxt sender selector = #executeFor: ] ] ].
	context ifNil: [ ^ self ].
	context swapSender: nil