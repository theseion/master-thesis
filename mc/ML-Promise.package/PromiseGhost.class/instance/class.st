accessing
class
	^ object isSeamlessProxy
		ifTrue: [ object seamlessReference class ]
		ifFalse: [ PromiseGhost for: object class ]