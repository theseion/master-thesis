private
isContextPostMortem: selectedContext
	^ ((interruptedContext hasContext: selectedContext) not and: [
			| index |
			index := interruptedProcess masterStackCopy indexOf: selectedContext.
			(interruptedProcess masterStack at: index) isDead ])