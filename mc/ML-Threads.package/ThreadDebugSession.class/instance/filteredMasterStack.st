private
filteredMasterStack
	| entryPoint firstLiveContext index liveStack deadStack |
	entryPoint := interruptedProcess masterStackCopy first findContextSuchThat: [ :context |
		context selector = #newUserProcess ].
	
	firstLiveContext := interruptedProcess masterStack
		detect: [ :context | context isDead not ]
		ifNone: [ ^ interruptedProcess masterStackCopy copyAfter: entryPoint ].
	
	"Include all live contexts so that actions on live contexts can be performed
	on that context immediately without the need to lookup the equivalent context."
	index := interruptedProcess masterStack indexOf: firstLiveContext.
	liveStack := interruptedProcess masterStack allButFirst: index - 1.
	deadStack := interruptedProcess masterStackCopy allButLast: interruptedProcess masterStackCopy size - index + 1.
	^ (deadStack copyAfter: entryPoint), liveStack