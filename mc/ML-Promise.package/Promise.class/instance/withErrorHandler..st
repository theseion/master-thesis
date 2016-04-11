private
withErrorHandler: aBlock
	[ 
		| value |
		value := aBlock value.
	 	(value asLocalObject isKindOf: Error) ifTrue: [ self handleError: value ] ]
			on: Error
			do: [ :ex | self handleError: ex ]