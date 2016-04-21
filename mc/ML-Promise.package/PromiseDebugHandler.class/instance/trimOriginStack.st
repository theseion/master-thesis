private
trimOriginStack
	"Remove unwanted stack frames"
	self contextStore originContext: (self contextStore originContext findContextSuchThat: [ :ctxt |
		ctxt method hasPragmaNamed: #promiseEntryPoint ]) sender copyStack