private
stepWith: aBlock inContext: aContext
	| filteredStack newContext |
	filteredStack := self filteredCombinedStack.
	newContext := aContext.
	
	[ newContext := self
		stepWith: aBlock
		inContext: newContext
		inStack: filteredStack ] doWhileFalse: [ 
			self isContextPostMortem: newContext ].
		
	^ newContext