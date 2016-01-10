*actiondescriptions-core
meetsCondition
	| originValues |
	originValues := self originReferences size = 1 
		ifTrue: [ self originReferences first value ] 
		ifFalse: [ GLMMultiValue withAll: (self originReferences collect: [:each | each value]) ].
	^ self condition glamourValue: originValues