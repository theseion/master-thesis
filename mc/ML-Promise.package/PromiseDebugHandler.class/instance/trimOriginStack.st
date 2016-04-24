private
trimOriginStack
	"Remove unwanted stack frames"
	| entryPoint |
	entryPoint := self contextStore originContext findContextSuchThat: [ :ctxt |
		ctxt method hasPragmaNamed: #promiseEntryPoint ].
	
	self contextStore
		realOriginTopContext: self contextStore originContext;
		originContext: entryPoint sender