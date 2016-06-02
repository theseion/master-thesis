private
trimmedOriginStack
	"Remove unwanted stack frames"
	| entryPoint |
	entryPoint := self contextStore originContext findContextSuchThat: [ :ctxt |
		ctxt method hasPragmaNamed: #promiseEntryPoint ].
	
	^ entryPoint sender stack