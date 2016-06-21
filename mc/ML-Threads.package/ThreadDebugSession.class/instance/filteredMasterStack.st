private
filteredMasterStack
	| masterHolder entryPointHolder |
	masterHolder := interruptedProcess masterProcessHolder.
	entryPointHolder := masterHolder findContextHolderSuchThat: [ :contextHolder |
		contextHolder originalContext selector = #newUserProcess ].
		
	^ masterHolder stackStartingAt: entryPointHolder