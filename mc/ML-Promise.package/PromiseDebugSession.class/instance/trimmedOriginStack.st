private
trimmedOriginStack
	"Remove unwanted stack frames"
	| entryPoint |
	self contextStore originProcess suspendedContext ifNil: [ ^ #() ].
	
	entryPoint := self contextStore originProcess suspendedContext findContextSuchThat: [ :ctxt |
		ctxt method hasPragmaNamed: #promiseEntryPoint ].
	
	^ (entryPoint
		ifNil: [ self contextStore originProcess suspendedContext ]
		ifNotNil: [ :ctxt | ctxt sender ]) stack