private
filteredMasterStack
	| masterHolder entryPointHolder |
	masterHolder := interruptedProcess masterProcessHolder.
	entryPointHolder := masterHolder findContextHolderSuchThat: [ :contextHolder |
		contextHolder originalContext selector = #newUserProcess ].
		
	^ entryPointHolder
		ifNil: [ masterHolder stack ]
		ifNotNil: [ masterHolder stackStartingAt: entryPointHolder ]
