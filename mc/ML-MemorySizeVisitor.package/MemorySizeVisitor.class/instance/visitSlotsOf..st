private
visitSlotsOf: anObject
	anObject class isVariable ifFalse: [ ^ self ].
	
	1
		to: anObject basicSize
		do: [ :index | self visit: (anObject basicAt: index) ]