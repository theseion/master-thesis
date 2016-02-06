as yet unclassified
withErrorHandler: aBlock
	[ 
		| value |
		value := aBlock value.
		"can't use #isKindOf: here since the value might be a proxy which
		does not intercept #=="
	 	(value class allSuperclasses anySatisfy: [ :class |
			class name = #Error ]) ifTrue: [ self handleError: value ] ]
				on: Error
				do: [ :ex | self handleError: ex ]