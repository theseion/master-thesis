private
filteredCombinedStack

	^ super stack
		addAll: interruptedProcess masterStackCopy;
		yourself