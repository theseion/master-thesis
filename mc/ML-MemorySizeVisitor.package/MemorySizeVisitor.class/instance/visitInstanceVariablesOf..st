private
visitInstanceVariablesOf: anObject
	1
		to: anObject class instSize
		do: [ :index | self visit: (anObject instVarAt: index) ]