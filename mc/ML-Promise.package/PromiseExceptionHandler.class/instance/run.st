operations
run
	[ 
		| value |
		value := self block value.
	 	(value asLocalObject isKindOf: Error) ifTrue: [ self handleException: value ] ]
			on: Error
			do: [ :ex | self handleException: ex ]